; Auto Logger
; Opens the game, logs in, does something, and then logs out
; it also attempts to reconnect to the game if it needs To
; a report of the activity of the script is generated

; includes
#include <Date.au3>
#include <File.au3>

; Fill the needed data
Local $exec_time = "04:00" ; time at which the script will get to work 24 hour format "hh:mm"
Local $username = "INSERT_ACCOUNT_NAME_HERE"
Local $password = "PASSWORD"
Local $char_name = "CHAR_NAME" ; Why did I need this?
Local $char_pos = 0	; you char on the list, 0 is the first on the list

; Turn off PC when done?
Global  $turn_off_pc = 0 ; 0 = No, 1 = yes

; computer files stuff
Local $path_to_tibia = "C:\Users\Diana German\AppData\Local\Tibia\Tibia.exe"
Local $path_to_script = "C:\Users\Diana German\Desktop\AUTOITSCRIPTS\ManaSitRuneMaker.exe"

; Report location
Global $filePath = "C:\Users\Diana German\Desktop\AUTOITSCRIPTS\"
Global $fileName = "Report.txt"


;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
; Code starts here
$fileNameAndPath = $filePath & $fileName
_FileCreate($fileNameAndPath)

; Globals to call between functions
Global $scriptPID
Global $tibiaPID
Global $file = FileOpen($fileNameAndPath, 1)

; -1. Open the File
$file = FileOpen($fileNameAndPath, 1)

; 0 Check time to start
;~ report("AutoLogger script open at time: " & _NowTime(4))
;~ report("Script execution is scheduled at time: " & $exec_time)
;~ check_time($exec_time)

report("Execution started, character: " & $char_name)
; 1 Open the game and get a global handle to it
openTibia($path_to_tibia)
; 2 Log in the game
LogIn($path_to_tibia, $username, $password, $char_pos)
; 3 Open the script
openScript($path_to_script)
; every 5 seconds:
while(True)
   Sleep(5000)
   ; 4 check that script is open, if it is closed, we're done
   if (not checkScript()) Then ; if script is closed
	  finish()
   EndIf
   ; 5 check that the char is still logged. If it's not, press ESC and login again
   if(not charIsOnline($char_name)) Then ; if char is not online
	  report("Disconnection detected. Relogging in.")
	  ; press ESC, in case there is a "reconnecting window"
	  Send("{ESC}")
	  ; relog In
	  LogIn($path_to_tibia, $username, $password, $char_pos)
   EndIf
WEnd


; Functions definitions
Func report($event)
   FileWrite($file, _NowDate()& "-" & _NowTime() & ":")
   FileWrite($file, $event & @CRLF)
   ConsoleWrite($event & @CRLF)
EndFunc

Func LogIn($path, $user, $pass, $pos)
; Log in - !!!Test before using that this function works properly!!!
report("Logging in.")
Send($user)
sleep(2500)
Send("{TAB}")
sleep(2500)
Send($pass)
sleep(2500)
Send("{ENTER}")
report("Input username and password: done")

; wait for the character list to appear
Sleep(3000)
; Select character from top to bottom by pressing the "down" arrow key
if($pos <> 0) Then
   For $i = 0 To $pos
	  Send("{DOWN}")
	  Sleep(500)
   Next
EndIf
; Hit Enter to finally Log In
Send("{ENTER}")
; Wait for the char and stuff to load
ConsoleWrite("Finished logging in." & @CRLF)
Sleep(5000)
EndFunc

Func check_time($time)
   ; you'll be on a continuous loop until $time matches with current Time
   while(_NowTime(4) <> $time)
	  Sleep(5000) ; wait 5 seconds to check again
   WEnd
   ; Now out of the loop is time to proceed with to code
EndFunc

Func openScript($path)
   ; opens a specified script and also checks that the client is still connected
   ; if it is not connected, press ESC and login again
   report("Opening Script.")
   $scriptPID = Run($path)
   report("Script open")
   ; the script must be autonomous, meaning once open, it must close itself when he finishes
EndFunc

Func checkScript()
   ; returns the PID if the script is open, 0 otherwise
   return(ProcessExists($scriptPID))
EndFunc

Func finish()
   report("Script finished, closing client.")
   Sleep(5000)
   report("Attempting to close client")
   if(ProcessClose("client.exe")) Then
	  report("Success")
   Else
	  report("Failure")
   EndIf
   ; close the file before leaving
   FileClose($file)

   ; turn off computer if needed
   if($turn_off_pc) Then
	  Shutdown(1)
   EndIf

   Exit 0 ; end of program
EndFunc

Func charIsOnline($name)
   ;returns 1 if the window of tibia says: Tibia - $name
   $windowName = "Tibia - " & $name
   Return(WinExists($windowName))
EndFunc

Func openTibia($path)
   $tibiaPID = Run($path, "", @SW_SHOWMAXIMIZED)
   report("Starting Tibia.")
   sleep(15000) ; wait for the game to load
EndFunc

