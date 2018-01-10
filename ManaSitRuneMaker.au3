#cs
   Spell caster Script
   Jose Luis German Felix
   12/Jan/2017

   This script eats food and casts a spell via hotkey simulation
   Therefore this script is *almost* undetectable.

   When a hotkey needs to be pressed, this script will focus on the client
   and perform the corresponding action.

   This script will attempt to make a specified number of runes.
   It will assume that you will have enough food, and that the character
   will remain connected during the execution of the code.

   If the character runs out of food, it will simply cast the spells without effect.
#ce

; fill in these variables
Local $spell_mana =  120; 350 for adori tera, 120 adori min vis
; Local $rune_string = "adori tera"
Local $food_reg_time = 144 ; fish = 144 secs
; rune spell will be cast with F12 and food will be F11
Local $no_of_runes = 42 ; This is the amount of runes you plan to make

#cs

:::::::::::::::::::::::::::::::::::::::::::
THE CODE BELOW DOES NOT NEED TO BE MODIFIED
:::::::::::::::::::::::::::::::::::::::::::

#ce

;counters and other data, do not modify
Local $food_counter = 0, $spell_counter = 0
Local $secs_for_spell = $spell_mana * 3 / 2
Local $times_casted = 0

; Activate tibia and let the world know you are alive
WinActivate("Tibia")
Send("ManaSit is on.")

While(True)
   ; wait one second
   Sleep(1000)
   ;increment counters
   $food_counter += 1
   $spell_counter += 1

   ; Check food
   if $food_counter = $food_reg_time Then ; time to eat
	  ; focus on tibia window
	  if(WinActivate("Tibia")) Then ; attempt to open the tibia window
		 sleep(1000)
		 Send("{F11}") ; press the eat button
	  EndIf
	  $food_counter = 0 ; reset counter even if you didnt eat
   EndIf

   ; Check spell
   if $spell_counter = $secs_for_spell Then
	  ; focus on tibia window
	  if(WinActivate("Tibia")) Then ; attempt to open the tibia window
		 sleep(1000)
		 Send("{F12}") ; press the spell button
		 $times_casted += 1
		 Send($times_casted & " of " & $no_of_runes)
		 ConsoleWrite("Casted " & $times_casted & " of " & $no_of_runes & " runes." & @CRLF)
	  EndIf
	  $spell_counter = 0 ; Reset counter even if no spell was casted
	  ; Notify the number of runes that have been made


	  ; Check if the work is completed
	  if($times_casted == $no_of_runes) Then
		 ConsoleWrite("Completed. Closing script")
		 Send("Finished. Bye.")
		 ExitLoop
	  EndIf
   EndIf

WEnd
ConsoleWrite("ManaSit says: GoodBye")
Exit 0 ; alles gut


