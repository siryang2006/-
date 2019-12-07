dim objShell
set objShell=wscript.createObject("WScript.Shell")
iReturnCode=objShell.Run("frpc.exe -c frpc.ini",0,TRUE)
