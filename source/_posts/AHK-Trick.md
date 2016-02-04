title: AHK-Trick
date: 2016-01-06 19:00:24
tags: 
---
## Read the hotstring from a file
**key : reload and #include file**

*Notice the include file should in front of the settimer Or the settimer will be blocked by the hotstring*

<!--more-->
You can use this method to make the *hot update*

```
#NoEnv
#NoTrayIcon
#SingleInstance force
#Persistent
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTimer, scriptReload, 5000
#Include %A_ScriptDir%\catena.txt
Return 

scriptReload:
	MsgBox, 0, , Reload, 3 ; 3 is the count down time
	Reload
	Return
```
