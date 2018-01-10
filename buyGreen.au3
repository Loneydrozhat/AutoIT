#cs

Tool for automated market items buying

When executed, this script buys the items located in an excel File.

IMPORTANT NOTE:
BEFORE EXECUTING THIS FILE, MAKE SURE THE MARKET WINDOW IS OPEN.
#ce

#include <Excel.au3>
#include "buyerCoordinates.au3"
#include <Misc.au3>

; name of the excel file to open
$excel_name = "TIBIA_TRADING.xlsx"
$excel_path = @ScriptDir & "\" & $excel_name
; name of the green djinn and rashid sheet names to open
$green_sheet  = "GREEN"
$rashid_sheet = "RASHID"



; open the excel File
Local $oExcel = _Excel_Open() ; create excel application object
If @error Then Exit MsgBox(16, "Excel UDF: _Excel_Open Example", "Error creating the Excel application object." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

Local $oWorkbook = _Excel_BookOpen($oExcel, $excel_path )
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookOpen", "Error opening '" & $excel_name & "'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; transfer the focus to the Tibia window
WinActivate ( "Tibia")
; before starting to buy any items, click on the "Anonymous button"
MouseClick ( "Primary", $anonCheckbox_x, $anonCheckbox_y)
; click on the "Buy" radio button
MouseClick ( "Primary", $buyRadioButton_x, $buyRadioButton_y)

; buy green items
; start reading from line 3
$current_line = 3

$item_name_cell_str = "A" & String($current_line)
$item_name_str  = _Excel_RangeRead($oWorkbook, $green_sheet, $item_name_cell_str)



; check that the next item is not empty
While (StringCompare($item_name_str, ""))
   ; obtain item quantity
   $item_qty_cell_str  = "G" & String($current_line)
   $item_qty_value_str = _Excel_RangeRead($oWorkbook, $green_sheet, $item_qty_cell_str)

   ; obtain item price in market
   $item_price_cell_str  = "C" & String($current_line)
   $item_price_value_str = _Excel_RangeRead($oWorkbook, $green_sheet, $item_price_cell_str)

   ; print next transaction information
   ConsoleWrite("Buying " & $item_qty_value_str & " " & $item_name_str & " for " & $item_price_value_str & " each." & @CRLF)

   ; create offer only if amount > 0
   if Number($item_qty_value_str) > 0 Then
	  ; Buying process
	  ; click on the search textbox and type item name
	  MouseClick ( "Primary", $searchTextBoxRight_x, $searchTextBoxRight_y)
	  Sleep(250)
	  Send($item_name_str)
	  Sleep(500)

	  ; click on the object in the list
	  MouseClick ( "Primary", $firstObjectList_x, $firstObjectList_y)
	  Sleep(500)

	  #cs
	  ; click on the piece price text box and type the item price
	  MouseClick ( "Primary", $piecePriceTextBox_x, $piecePriceTextBox_y)
	  Send($item_price_value_str)
	  #ce
	  ; edit - instead of typing the value, wait for the user to type the price and hit enter
	  MouseClick ( "Primary", $piecePriceTextBox_x, $piecePriceTextBox_y)
	  Do
		 Sleep(25)
		 Until _IsPressed("0D") ; Enter Key
	  Sleep(500)


	  ; click on the increase amount, n-1 times (because it starts at 1)
	  $nClicks = Number($item_qty_value_str) - 1
	  for $i = 1 To $nClicks
		 MouseClick ( "Primary", $amountIncrease_x, $amountIncrease_y)
		 Sleep(500)
	  Next
	  Sleep(500)

	  ; click on the create offer button
	  MouseClick ( "Primary", $createOfferButton_x, $createOfferButton_y)
	  Sleep(2000)

	  ; press the enter key in case the offer is automatically matched
	  Send("{ENTER}")
	  Sleep(500)


	  ; click on the search text box and delete item name by doing a triple click
	  MouseClick ( "Primary", $searchTextBoxRight_x, $searchTextBoxRight_y)
	  Sleep(500)
	  MouseClick ( "Primary", $searchTextBoxRight_x, $searchTextBoxRight_y, 3)
	  Send("{BS}")
	  Sleep(500)
   EndIf

   ; obtain next item name
   $current_line       = $current_line + 1
   $item_name_cell_str = "A" & String($current_line)
   $item_name_str      = _Excel_RangeRead($oWorkbook, $green_sheet, $item_name_cell_str)
WEnd

; after all offers have been created, the cursor should be in the item textbox, send a "Finish" to let me know it's done
Send("finished")


