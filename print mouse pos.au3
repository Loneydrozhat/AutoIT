; Get Mouse Coords
While 1
   $mPos = MouseGetPos()
   ConsoleWrite("x: " & $mPos[0] & "y : " & $mPos[1] & @CRLF)
   sleep(1000)
Wend