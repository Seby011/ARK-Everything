CoordMode, ToolTip, Screen ; makes tooltip to appear at position, relative to screen.
Mode = 0

RemoteSearchX = 1300
RemoteSearchY = 180
RemoteDropX = 1530
RemoteDropY = 190
RemoteTransferAllX = 1480
RemoteTransferAllY = 190
LocalSearchX = 175
LocalSearchY = 180
LocalTransferAllX = 350
LocalTransferAllY = 190
InvPixelX = 1488
InvPixelY = 180

SetTimer UKey, 500
SetTimer EKey, 500
SetTimer Click, 50

RCtrl::Send % "{w " . ( GetKeyState("w") ? "Up}" : "Down}" )

F3::
If (Mode = 0)
Loop
{
	Send f
	Sleep 250
	MouseMove, %RemoteSearchX%, %RemoteSearchY%, 1
	Send {Click}
	Send, stone
	Sleep 250
	MouseMove, %RemoteDropX%, %RemoteDropY%, 1
	Send {Click}
	Sleep 250
	MouseMove, %RemoteSearchX%, %RemoteSearchY%, 1
	Send {Click}
	Send, flint
	Sleep 250
	MouseMove, %RemoteDropX%, %RemoteDropY%, 1
	Send {Click}
	Sleep 250
	MouseMove, %RemoteSearchX%, %RemoteSearchY%, 1
	Send {Click}
	Send, thatch
	Sleep 250
	MouseMove, %RemoteDropX%, %RemoteDropY%, 1
	Send {Click}
	Sleep 250
	MouseMove, %RemoteSearchX%, %RemoteSearchY%, 1
	Send {Click}
	Send, wood
	Sleep 250
	MouseMove, %RemoteDropX%, %RemoteDropY%, 1
	Send {Click}
	Sleep 250
	Send {Esc}
	Break
}
Return

F4::EToggle := !EToggle
	EKey:
		If (!EToggle)
		Return
		Send e
	return

F5::CToggle := !CToggle
	Click:
		If (!CToggle)
		Return
		click
	return

F6::UToggle := !UToggle
	UKey:
		If (!UToggle)
		Return
		Send u
	return


F7::
If (Mode = 0)
{
	Mode = 1
	ToolTip, Magic F - Raw Meat Mode,0,0
}

Else If (Mode = 1)
{
	Mode = 2
	ToolTip, Magic F - Cooked Meat Mode,0,0
}

Else If (Mode = 2)
{
	Mode = 3
	ToolTip, Magic F - Berry Mode,0,0
}

Else If (Mode = 3)
{
	Mode = 4
	ToolTip, Magic F - Paste Mode,0,0
}

Else If (Mode = 4)
{
	Mode = 5
	ToolTip, Magic F - Sap Mode,0,0
}

Else If (Mode = 5)
{
	Mode = 6
	ToolTip, Magic F - Crop Plot,0,0
}
Else If (Mode = 6)
{
	Mode = 0
	ToolTip, Magic F - OFF,0,0
	Sleep 1500
	Tooltip
}
 Return

^+F4::
{
	Mode = 1
	ToolTip, Magic F - Raw Meat Mode,0,0
}
Return

^+F5::
{
	Mode = 2
	ToolTip, Magic F - Cooked Meat Mode,0,0
}
Return

^+F6::
{
	Mode = 3
	ToolTip, Magic F - Berry Mode,0,0
}
Return

^+F7::
{
	Mode = 4
	ToolTip, Magic F - Sap Mode,0,0
}
Return

^+F8::
{
	Mode = 0
	ToolTip, Magic F - OFF,0,0
	Sleep 1500
	Tooltip
}
Return

~F::
If (Mode = 1)
Loop
{
	pixelgetcolor, Color, %InvPixelX%, %InvPixelY%
	If (Color = "0xA98A00") {
		MouseMove, %RemoteSearchX%, %RemoteSearchY%, 1
		Send {Click}
		Send, oil
		MouseMove, %RemoteTransferAllX%, %RemoteTransferAllY%, 1
		Send {Click}
		Sleep 250
		MouseMove, %LocalSearchX%, %LocalSearchY%, 1
		Send {Click}
		Send, raw
		MouseMove, %LocalTransferAllX%, %LocalTransferAllY%, 1
		Send {Click}
		Send {Esc}
		break
	}
}

If (Mode = 2)
Loop
{
	pixelgetcolor, Color, %InvPixelX%, %InvPixelY%
	If (Color = "0xA98A00") {
		MouseMove, %RemoteSearchX%, %RemoteSearchY%, 1
		Send {Click}
		Send, oil
		MouseMove, %RemoteTransferAllX%, %RemoteTransferAllY%, 1
		Send {Click}
		Sleep 250
		MouseMove, %LocalSearchX%, %LocalSearchY%, 1
		Send {Click}
		Send, cooked
		MouseMove, %LocalTransferAllX%, %LocalTransferAllY%, 1
		Send {Click}
		Send {Esc}
		break
	}
}

Else If (Mode = 3)
Loop
{
	pixelgetcolor, Color, %InvPixelX%, %InvPixelY%
	If (Color = "0xA98A00") {
		MouseMove, %LocalSearchX%, %LocalSearchY%, 1
		Send {Click}
		Send, mejo
		MouseMove, %LocalTransferAllX%, %LocalTransferAllY%, 1
		Send {Click}
		Send {Esc}
		break
	}
}

Else If (Mode = 4)
Loop
{
	pixelgetcolor, Color, %InvPixelX%, %InvPixelY%
	If (Color = "0xA98A00") {
		MouseMove, %RemoteSearchX%, %RemoteSearchY%, 1
		Send {Click}
		Send, paste
		MouseMove, %RemoteTransferAllX%, %RemoteTransferAllY%, 1
		Send {Click}
		Send {Esc}
		break
	}
}

Else If (Mode = 5)
Loop
{
	pixelgetcolor, Color, %InvPixelX%, %InvPixelY%
	If (Color = "0xA98A00") {
		MouseMove, %RemoteSearchX%, %RemoteSearchY%, 1
		Send {Click}
		Send, sap
		MouseMove, %RemoteTransferAllX%, %RemoteTransferAllY%, 1
		Send {Click}
		Send {Esc}
		break
	}
}

Else If (Mode = 6)
Loop
{
	pixelgetcolor, Color, %InvPixelX%, %InvPixelY%
	If (Color = "0xA98A00") {
		MouseMove, %RemoteSearchX%, %RemoteSearchY%, 1
		Send {Click}
		Send, mejo
		MouseMove, %RemoteTransferAllX%, %RemoteTransferAllY%, 1
		Send {Click}
		Send {Esc}
		break
	}
}
