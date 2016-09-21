@echo off

echo. Ajout de "addon.d"
adb shell "mkdir /system/addon.d"
adb push .\files\gapps\system\addon.d\ /system/addon.d\

echo. Ajout des application Google
adb push .\files\gapps\system\app /system/app

echo. Ajout synchronisation du dossier "etc"
adb push .\files\gapps\system\etc /system/etc

echo. Ajout des frameworks Google
adb push .\files\gapps\system\framework /system/framework

echo. Ajout des librairies Google
adb push .\files\gapps\system\lib /system/lib

echo. Ajout des TTS
adb push .\files\gapps\system\tts /system/tts

goto :DO6
:d6
adb shell "rm -r /data/dalvik-cahce"
adb shell "mkdir /data/dalvik-cache"
adb shell "busybox sync"
goto :ro
