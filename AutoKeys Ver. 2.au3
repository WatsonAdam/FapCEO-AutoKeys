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
EndFunc


SplashTextOn("AutoKeys", "F6-Pause Continue Program" & @CRLF & "F10-Exit Program", 200, 55, 0, 0, 5, "", 10)

$bautoClick=False

$event = MsgBox(3,"AutoKeys Setup", "Is there an event requiring the opening of chests?")
If $event=6 Then
   $bevent=True
   $min=@MIN

   MsgBox(0, "AutoKeys Setup", "Place your cursor over the chest. Press enter when ready.")
   $chestx=MouseGetPos(0)
   $chesty=MouseGetPos(1)

ElseIf $event=7 Then
   $bevent=False
ElseIf $event=2 Then
   Exit
EndIf

MsgBox(0, "AutoKeys", "Place your cursor over girl #5. Press enter when ready, then press F6 to unpause program.")
$girlx=MouseGetPos(0)
$girly=MouseGetPos(1)


While True
   While $bautoClick
	  MouseClick("left", $girlx, $girly, 1, 0)
	  sleep(20)
	  If $bevent Then
		 While @MIN=$min
			collectChest()
		 WEnd
	  EndIf
   WEnd
   Sleep(5)
WEnd