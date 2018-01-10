#cs
   This program will throw items in the current player square, in order to hide the item at the bottom.
   This is useful for hiding a bag with loot in a hunting ground.

   Very important. Before running this script, make sure of the following:
   1) you have the backpacks, and battle list windows in the right order.
   2) you have the items in the following order in you main backpack:
	  1) the bag you will hide
	  2) one item that can be
#ce

#include "LootHelperPositions.au3"

; give focus to the tibia screen
; important note: If multiple tibia clients are open, it may lead to errors, so please only run one tibia client at a time.
$activation = WinActivate("Tibia")

; throw the bag in the players current square
Sleep(10)
MouseClickDrag("primary", $hideBagItem1_x, $hideBagItem1_y, $player_x, $player_y, 0)
; throw item 1 and item 2 ten times each to hide the bag at the bottom, while pressing the Shift key to make sure items are thrown one at a time
For $i=0 To 10
   ; throw item 1 while holding shift
   Send("{SHIFTDOWN}")
   MouseClickDrag("primary", $hideBagItem1_x, $hideBagItem1_y, $player_x, $player_y, 0)
   Send("{SHIFTUP}")
   ; wait some ms
   Sleep(25)
   ; throw item 2
   Send("{SHIFTDOWN}")
   MouseClickDrag("primary", $hideBagItem2_x, $hideBagItem2_y, $player_x, $player_y, 0)
   Send("{SHIFTUP}")
   ; wait some ms
   Sleep(25)
Next