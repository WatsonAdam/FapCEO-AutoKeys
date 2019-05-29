#comments-start

AutoKeys
Program Created By: Adam Watson
-------------------------------
This program is an automatic bot for the game Fap CEO.
The bot will collect keys and items from chests automatically.
Feel free to modify my code. Please give credit if reuploading.

#comments-end


HotKeySet("{F10}", "myExit")
HotKeySet("{F6}", "togAutoClick")


Func myExit()
	Exit
 EndFunc

Func togAutoClick()
   If $bautoClick = False Then
	  $y=MouseGetPos(1)
	  $bautoClick = True
   else
	  $bautoClick = False
   EndIf
EndFunc

Func collectChest()
   $d=1
   While $d<20
	  MouseClick("left",$chestx,$chesty,1)
	  sleep(20)
	  $d=$d+1
   WEnd
   $times=$times+1
EndFunc


SplashTextOn("AutoKeys", "F6-Pause Continue Program" & @CRLF & "F10-Exit Program", 200, 55, 0, 0, 5, "", 10)

$bautoClick=False

$event = MsgBox(3,"AutoKeys Setup", "Is there an event requiring the opening of chests?")
If $event=6 Then
   $bevent=True
   $hours = InputBox("AutoKeys Setup", "How many hours between chest openings?")
   $bset = True
   $min=@MIN
   $times=0

   While $bset
	  If $hours = IsNumber($hours) Then
		 $bset = True
		 $hours = InputBox("AutoKeys Setup", "How many hours between chest openings? Please enter an integer.")
	  Else
		 $bset = False
	  EndIf
   WEnd

   MsgBox(0, "AutoKeys Setup", "Place your cursor over the chest. Press enter when ready.")
   $chestx=MouseGetPos(0)
   $chesty=MouseGetPos(1)

ElseIf $event=7 Then
   $bevent=False
ElseIf $event=2 Then
   Exit
EndIf

MsgBox(0, "AutoKeys", "Place your cursor over girl #5. Press enter when ready, then press F6 to unpause program.")


While True
   While $bautoClick
	  $x=MouseGetPos(0)
	  $y=MouseGetPos(1)
	  MouseClick("left", $x, $y, 1, 0)
	  sleep(20)
	  If $bevent Then
		 If @MIN = $min Then
			If Mod($times, $hours) = 0 Then
			   collectChest()
			EndIf
		 EndIf
	  EndIf
	  MouseClick("left", $x, $y, 1, 0)
   WEnd
   Sleep(5)
WEnd