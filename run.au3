#include <Constants.au3>
#include <GUIConstantsEx.au3>
#include "ImageSearch.au3"

Local $hGUI = GUICreate("Hello World", 200, 100)
GUICtrlCreateLabel("Hello world! How are you?", 30, 10)
Local $iOKButton = GUICtrlCreateButton("OK", 70, 50, 60)
GUISetState(@SW_SHOW, $hGUI)

Local $iMsg = 0
Local $doneKalPick = -1
While 1
    $iMsg = GUIGetMsg()
    Switch $iMsg
		Case $iOKButton
			GUICtrlSetState($iOKButton, $GUI_DISABLE)
            $doneKalPick = runKalPick()
        Case $GUI_EVENT_CLOSE
            MsgBox($MB_SYSTEMMODAL, "GUI Event", "You selected the Close button. Exiting...")
            ExitLoop
	EndSwitch

	Switch $doneKalPick
		Case 0
			MsgBox($MB_SYSTEMMODAL, "GUI Event", "Can't find champion image")
			setInit()
		Case 1
			setInit()
	EndSwitch
WEnd

GUIDelete($hGUI)

Func setInit()
	GUICtrlSetState($iOKButton, $GUI_ENABLE)
	$doneKalPick = -1
EndFunc

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Func runKalPick()
	Local $image = @ScriptDir & "\" & "image" & "\" & "start.png"
	Local $waitSecs = 10000
	Local $resultPosition = 1
	Local $x, $y
	Local $tolerance = 40
	Local $result = _WaitForImageSearch($image,$waitSecs,$resultPosition,$x, $y,$tolerance)

	ConsoleWrite($result & @CRLF)

	If $result = 1 Then
		MouseClick("left", $x, $y, 1, 1)
		return 1
	EndIf

	return 0
EndFunc
