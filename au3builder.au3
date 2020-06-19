
If $CmdLine[0] < 1 Then Exit

DirCreate("temp\")

ConvertA3X()
ConvertSFX()


Func ConvertA3X()
	RunWait(@ScriptDir & '\3rd\Aut2Exe\Aut2Exe.exe /in "' & $CmdLine[1] & '" /out "temp\script.a3x"', @ScriptDir, @SW_HIDE)
EndFunc   ;==>ConvertA3X

Func ConvertSFX()
	RunWait(@ScriptDir & '\3rd\rar.exe a -afzip -cfg- -ed -ep1 -k -m5 -r -tl "-sfx'& @ScriptDir &'\3rd\Zip.sfx" "-zComment file with full path containing SFX options" "'& @ScriptDir &'\sfx.exe" "'& @ScriptDir &'\temp\script.a3x" "'& @ScriptDir &'\3rd\start.bat"', @ScriptDir)
EndFunc