


Local $exec_time = "03:30"

check_time($exec_time)
Shutdown(1)


Func check_time($time)
   ; you'll be on a continuous loop until $time matches with current Time
   while(_NowTime(4) <> $time)
	  Sleep(5000) ; wait 5 seconds to check again
   WEnd
   ; Now out of the loop is time to proceed with to code
EndFunc