; Tibia Loot Helper
; 16 Januar 17 v1.0
; 11 Februar 17 v2.0
; Makes looting easier

;Instructions here
; setup: Open battle list such that it shows 3 enemies


; Libraries
#include <Misc.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>
#include "LootHelperPositions.au3"


; F used for the rope
$fRope = "{F12}"

Local $activate = True ; pause script execution (used when you want to write)


Local $hDLL = DllOpen("user32.dll")

While 1

   If _IsPressed("22", $hDLL) Then ; Key "avpag"
	  ; set activate var to its other state
	  if($activate = 1) Then; if it is 1, deactivate it
		 $activate = 0
		 Send("Script paused")
	  Else
		 $activate = 1
		 Send("Script resumed")
	  EndIf
	  ; Wait until key is released
	  While _IsPressed("22", $hDLL)
		 Sleep(10)
	  WEnd
   EndIf

   If (_IsPressed("31", $hDLL) and $activate) Then ; Key "1"
	  ; save mouse pos
	  $mPos = MouseGetPos()
	  ;ConsoleWrite("Key 1 Pressed" & @CRLF) ; for debugging only
	  ; Drag items
	  MouseClickDrag("primary", $x[3], $y[3], $x[1], $y[1], 0)
	  ; Return mouse to original pos
	  MouseMove($mPos[0], $mPos[1], 0)
	  ; Wait until key is released
	  While _IsPressed("31", $hDLL)
		 Sleep(10)
	  WEnd
   EndIf

   If (_IsPressed("32", $hDLL) and $activate) Then ; Key "2"
	  ; save mouse pos
	  $mPos = MouseGetPos()
	  ;ConsoleWrite("Key 2 Pressed" & @CRLF) ; for debugging only
	  ; Drag items
	  MouseClickDrag("primary", $x[6], $y[6], $x[4], $y[4], 0)
	  ; Return mouse to original pos
	  MouseMove($mPos[0], $mPos[1], 0)
	  ; Wait until key is released
	  While _IsPressed("32", $hDLL)
		 Sleep(10)
	  WEnd
   EndIf

   If (_IsPressed("33", $hDLL) and $activate) Then ; Key "3"
	  ; save mouse pos
	  $mPos = MouseGetPos()
	  ;ConsoleWrite("Key 3 Pressed" & @CRLF) ; for debugging only
	  ; Drag items
	  MouseClickDrag("primary", $x[9], $y[9], $x[7], $y[7], 0)
	  ; Return mouse to original pos
	  MouseMove($mPos[0], $mPos[1], 0)
	  ; Wait until key is released
	  While _IsPressed("33", $hDLL)
		 Sleep(10)
	  WEnd
   EndIf

   If (_IsPressed("34", $hDLL) and $activate) Then ; Key "4"
	  ; save mouse pos
	  $mPos = MouseGetPos()
	  ;ConsoleWrite("Key 4 Pressed" & @CRLF) ; for debugging only
	  ; Drag items
	  MouseClickDrag("primary", $x[12], $y[12], $x[10], $y[10], 0)
	  ; Return mouse to original pos
	  MouseMove($mPos[0], $mPos[1], 0)
	  ; Wait until key is released
	  While _IsPressed("34", $hDLL)
		 Sleep(10)
	  WEnd
   EndIf

   If (_IsPressed("51", $hDLL) and $activate) Then ; Key "Q"
	  ; save mouse pos
	  $mPos = MouseGetPos()
	  ;ConsoleWrite("Key Q Pressed" & @CRLF) ; for debugging only
	  ; Drag items
	  MouseClickDrag("primary", $x[3], $y[3], $x[2], $y[2], 0)
	  ; Return mouse to original pos
	  MouseMove($mPos[0], $mPos[1], 0)
	  ; Wait until key is released
	  While _IsPressed("51", $hDLL)
		 Sleep(10)
	  WEnd
   EndIf

If (_IsPressed("57", $hDLL) and $activate) Then ; Key "W"
	  ; save mouse pos
	  $mPos = MouseGetPos()
	  ;ConsoleWrite("Key 57 Pressed" & @CRLF) ; for debugging only
	  ; Drag items
	  MouseClickDrag("primary", $x[6], $y[6], $x[5], $y[5], 0)
	  ; Return mouse to original pos
	  MouseMove($mPos[0], $mPos[1], 0)
	  ; Wait until key is released
	  While _IsPressed("57", $hDLL)
		 Sleep(10)
	  WEnd
   EndIf

If (_IsPressed("45", $hDLL) and $activate) Then ; Key "E"
	  ; save mouse pos
	  $mPos = MouseGetPos()
	  ;ConsoleWrite("Key E Pressed" & @CRLF) ; for debugging only
	  ; Drag items
	  MouseClickDrag("primary", $x[9], $y[9], $x[8], $y[8], 0)
	  ; Return mouse to original pos
	  MouseMove($mPos[0], $mPos[1], 0)
	  ; Wait until key is released
	  While _IsPressed("45", $hDLL)
		 Sleep(10)
	  WEnd
   EndIf

If (_IsPressed("52", $hDLL) and $activate) Then ; Key "R"
	  ; save mouse pos
	  $mPos = MouseGetPos()
	  ;ConsoleWrite("Key R Pressed" & @CRLF) ; for debugging only
	  ; Drag items
	  MouseClickDrag("primary", $x[12], $y[12], $x[11], $y[11], 0)
	  ; Return mouse to original pos
	  MouseMove($mPos[0], $mPos[1], 0)
	  ; Wait until key is released
	  While _IsPressed("52", $hDLL)
		 Sleep(10)
	  WEnd
   EndIf

If (_IsPressed("5A", $hDLL) and $activate) Then ; Key "Z"
	  ; save mouse pos
	  $mPos = MouseGetPos()
	  ;ConsoleWrite("Key Z Pressed" & @CRLF) ; for debugging only
	  ; Click on battle list pos 1
	  MouseClick("primary", $bx, $by1, 1, 0)
	  ; Return mouse to original pos
	  MouseMove($mPos[0], $mPos[1], 0)
	  ; Wait until key is released
	  While _IsPressed("5A", $hDLL)
		 Sleep(10)
	  WEnd
   EndIf

If (_IsPressed("58", $hDLL) and $activate) Then ; Key "X"
	  ; save mouse pos
	  $mPos = MouseGetPos()
	  ;ConsoleWrite("Key Z Pressed" & @CRLF) ; for debugging only
	  ; Click on battle list pos 1
	  MouseClick("primary", $bx, $by2, 1, 0)
	  ; Return mouse to original pos
	  MouseMove($mPos[0], $mPos[1], 0)
	  ; Wait until key is released
	  While _IsPressed("58", $hDLL)
		 Sleep(10)
	  WEnd
   EndIf

If (_IsPressed("43", $hDLL) and $activate) Then ; Key "C"
	  ; save mouse pos
	  $mPos = MouseGetPos()
	  ;ConsoleWrite("Key C Pressed" & @CRLF) ; for debugging only
	  ; Click on battle list pos 1
	  MouseClick("primary", $bx, $by3, 1, 0)
	  ; Return mouse to original pos
	  MouseMove($mPos[0], $mPos[1], 0)
	  ; Wait until key is released
	  While _IsPressed("43", $hDLL)
		 Sleep(10)
	  WEnd
   EndIf

If (_IsPressed("20", $hDLL) and $activate) Then ; Key "SPACEBAR"
	  ; save mouse pos
	  $mPos = MouseGetPos()
	  ;ConsoleWrite("Key C Pressed" & @CRLF) ; for debugging only
	  MouseClick("secondary", 594, 305, 1, 0)
	  ; Return mouse to original pos
	  MouseMove($mPos[0], $mPos[1], 0)
	  ; Wait until key is released
	  While _IsPressed("20", $hDLL)
		 Sleep(10)
	  WEnd
   EndIf

   If (_IsPressed("55", $hDLL) and $activate) Then ; Key "U"
	  ; save mouse pos
	  $mPos = MouseGetPos()
	  ; press the key for the rope
	  Send($fRope)
	  Sleep(10)
	  ;ConsoleWrite("Key C Pressed" & @CRLF) ; for debugging only
	  MouseClick("primary", 594, 305, 1, 0)
	  ; Return mouse to original pos
	  MouseMove($mPos[0], $mPos[1], 0)
	  ; Wait until key is released
	  While _IsPressed("55", $hDLL)
		 Sleep(10)
	  WEnd
   EndIf

sleep(100)
WEnd