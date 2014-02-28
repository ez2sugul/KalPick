#include "AssocArrays.au3"
#include "ImageSearch.au3"
#include <ScreenCapture.au3>
#include <File.au3>

#include <GUIConstantsEx.au3>

Opt("GUIOnEventMode", 1)
Local $hGUI = GUICreate("Hello World", 200, 100)
GUISetState(@SW_SHOW, $hGUI)
Local $hButton = GUICtrlCreateButton("½ÃÀÛ", 30, 30)

While 1
	$iMsg = GUIGetMsg()

	If $iMsg = 0 Then
		ConsoleWrite("msg " & $iMsg & @CRLF)
	ElseIf $iMsg > 0  Then
		ConsoleWrite("msg " & $iMsg & @CRLF)
	ElseIf $iMsg < 0 Then
		If $iMsg = $GUI_EVENT_CLOSE Then
			ExitLoop
		EndIf
		ConsoleWrite("msg " & $iMsg & @CRLF)
	EndIf

WEnd

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Func main()
	Local $image = @ScriptDir & "\" & "image" & "\" & "start.png"
	Local $waitSecs = 10000
	Local $resultPosition = 1
	Local $x, $y
	Local $tolerance = 40
	Local $result = _WaitForImageSearch($image,$waitSecs,$resultPosition,$x, $y,$tolerance)

	ConsoleWrite($result & @CRLF)

	If $result = 1 Then
		MouseClick("left", $x, $y, 1, 1)
	EndIf
EndFunc
