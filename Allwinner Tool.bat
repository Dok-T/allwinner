@echo off
adb kill-server
:menu
titleAllwinner A10/33 tool by Doctor_Titi
color 3B
cls
:hidden
echo."----------------------------------------------------"
echo."    _____        _____        _____                 "                
echo."   /     \      /     \      /     \  --v18.09--    "               
echo."  <       >----<       >----<       >   -#16-       "              
echo."   \_____/      \_____/      \_____/                "               
echo."   /     \      /     \      /     \                "               
echo."  <       >----<       >----<       >----.          "         
echo."   \_____/      \_____/      \_____/      \         "        
echo."         \      /     \      /     \      /         "        
echo."          >----<       >----<       >----<          "         
echo."         /      \_____/      \_____/      \_____    "   
echo."         \      /     \      /     \      /     \   "  
echo."          `----<       >----<       >----<       >  " 
echo."                \_____/      \_____/      \_____/   "  
echo."  Allwinner A10/33 tool      /     \      /         "        
echo."                            <       >----'          "         
echo."      By Doctor_Titi         \_____/                "               
echo."                                                    "
echo."        NE PAS OUBLIER DE ACTIVER ADB SUR ANDROID   "
echo."____________________________________________________"
echo.


echo. Bienvenue dans ce script pour recuperer votre tablette.
echo. !!! VOUS DEVEZ AU PREALABLE ACTIVER ADB SUR VOTRE TABLETTE OU ETRE DANS LE RECOVERY AVEC ADB !!!
echo.
echo.

SET /P q=Faites (help) pour savoir la liste de commande disponible!: 
 IF /i {%q%}=={help} (GOTO :help)
 IF /i {%q%}=={partition} (GOTO :LIST_PARTITIONS)
 IF /i {%q%}=={driver} (GOTO :driver)
 IF /i {%q%}=={push10} (GOTO :push10)
 IF /i {%q%}=={restore10} (GOTO :restore10)
 IF /i {%q%}=={procedure} (GOTO :procedure)
 IF /i {%q%}=={rcv} (GOTO :recovery)
 IF /i {%q%}=={reboot} (GOTO :rbt)
 IF /i {%q%}=={info} (GOTO :tools)
 IF /i {%q%}=={truepart} (GOTO :tp)
 IF /i {%q%}=={rw} (GOTO :rw)
 IF /i {%q%}=={rtl} (GOTO :bb)
 IF /i {%q%}=={ro} (GOTO :ro)
 IF /i {%q%}=={gapps10} (GOTO :gapps10)
 IF /i {%q%}=={debloat10} (GOTO :debloat10)
 IF /i {%q%}=={rcvwipe} (GOTO :rcvwipe)
 IF /i {%q%}=={bootloader10} (GOTO :bootloader10)
 IF /i {%q%}=={exit} (exit)
 IF /i {%q%}=={clear} (goto :menu)

REM FR: Outils en beta! a utiliser avec precaution!
REM EN: Beta tools! be careful!
 IF /i {%q%}=={push10beta} (goto :push10beta)
 IF /i {%q%}=={restorebeta} (goto :restorebeta)
 

 
 
pause|ECHO Mauvaise reponse!
goto :menu


:DRIVER
title Drivers: Allwinner A10/33 tool by Doctor_Titi
.\files\driver\adb-setup-1.4.3.exe
goto :menu

:help
title Aide: Allwinner A10/33 tool by Doctor_Titi
echo.
echo Liste de commandes disponible:
echo.
echo.
echo. - "help" = Affiche cette aide
echo.
echo. - "partition" = Affiche les partition theorique de la tablette dans /dev/block (SANS ADB) .
echo.
echo. - "driver" = Installe ADB, FASTBOOT et les drivers. A FAIRE EN premier si vous ne lavez pas fait.
echo.
echo. - "push10" = Envoie les fichiers important sur votre tablette via ADB. A FAIRE en SECOND pour pouvoir restore10 votre tablette avec un cpu type A10.
echo.
echo. - "procedure" = Affiche la procedure de restoration a respecter (A10).
echo.
echo. - "restore10" = Assistant de restoration de votre tablette(A10)
echo.
echo. - "reboot" = Redemarre la tablette dans differents modes.
echo.
echo. - "info" = Affiche des informations avancee de la tablette (universal)
echo.
echo. - "rw" = Monte la partition /system en ecriture et en lecture jusq'au prochian (re)demarrage!
echo.
echo. - "ro" = Monte la partition /system en lecture seule
echo.
echo. - "truepart" = Affiche les partitions et les point de montage de la tablette.
echo.
echo. - "rtl" = (Root tools Lite) Installe des applications de developpement/root en /data.
echo. / inclut: Terminal Emulator v1.0.7.0, Busybox v42, No-frills CPU control v1.28.2 et SuperSu v2.76 \
echo.
echo. - "rcv" = Assistant d'installation de recovery custom.
echo.
echo. - "gapps10" = Assistant d'installation des services Google (besoin d'au moins 42mo de libre dans /system)(A10 ICS)
echo.
echo. - "debloat10" = Assistant de suppression des appli inutile (AppsLib et Update)(A10)
echo.
echo. - "rcvwipe" = Menu permettant de controller le recovery custom en ligne de comande. (Universal)
echo.
echo. - "bootloader10" = WARING: UNIQUEMENT POUR AN7G3 AVEC UN A10! Flash le bootloader10 stock et vous propose d'installer un recovery custom.
echo.
echo. - "exit" = A la prochaine ;)
echo.
echo. - "clear" = Remise a zero de la page
echo.

pause|echo OK?
goto :menu


:LIST_PARTITIONS
title Partitions: Allwinner A10/33 tool by Doctor_Titi
echo List des partition de la tablette (theoriquement): 

echo.
echo.
echo Partitions pur A10
echo. NANDA - /dev/block/nanda = bootloader
echo. NANDB - /dev/block/nandb = ENVIRONMENT
echo. NANDC - /dev/block/nandc = BOOT\KERNEL
echo. NANDD - /dev/block/nandd = SYSTEM
echo. NANDE - /dev/block/nande = DATA
echo. NANDF - /dev/block/nandf = MISC
echo. NANDG - /dev/block/nandg = RECOVERY
echo. NANDH - /dev/block/nandh = CACHE
echo. NANDI - /dev/block/nandi = Memoire de stcokage interne (monte comme cartesd sur les rom stock)
echo.
echo.
echo.
echo.
echo. Partitions Allwinner A10
echo.
echo. NANDA - /dev/block/nanda = bootloader
echo. NANDB - /dev/block/nandb = env (environnement)
echo. NANDC - /dev/block/nandc = boot / kernel
echo. NANDD - /dev/block/nandd = SYSTEM
echo. NANDE - /dev/block/nandj = DATA
echo. NANDF - /dev/block/nandf = MISC
echo. NANDG - /dev/block/nandg = RECOVERY
echo. NANDH - /dev/block/nandg = CACHE
echo. NANDI - /dev/block/nandi = Memoire de stcokage interne (monte comme Carte SD sur les rom stock)
echo.
echo.
echo. Partition Allwinner A33
echo.
echo. NANDA - /dev/block/nanda = bootloader
echo. NANDB - /dev/block/nandb = env (environnement)
echo. NANDC - /dev/block/nandc = boot / kernel
echo. NANDD - /dev/block/nandd = system
echo. NANDE - /dev/block/nande = misc
echo. NANDF - /dev/block/nandf = recovery
echo. NANDG - /dev/block/nandg = cache 
echo. NANDH - /dev/block/nandh = metadata
echo. NANDI - /dev/block/nandi = private
echo. NANDJ - /dev/block/nandj = UDISK


pause|echo OK?
goto :menu



:push10
title Preparation: Allwinner A10/33 tool by Doctor_Titi
adb shell "mkdir /mnt/extsd/nand/"
adb push .\files\nand\nanda.img /mnt/extsd/nand/
adb push .\files\nand\nandb.img /mnt/extsd/nand/
adb push .\files\nand\nandc.img /mnt/extsd/nand/
adb push .\files\nand\nandd.img /mnt/extsd/nand/
pause|echo PASS!
goto :menu

:push10beta
title [BETA]Preparation: Allwinner A10/33 tool by Doctor_Titi
adb shell "mkdir /sdcard/nand/"
adb push .\files\nand\nanda.img /sdcard/nand/
adb push .\files\nand\nandb.img /sdcard/nand/
adb push .\files\nand\nandc.img /sdcard/nand/
adb push .\files\nand\nandd.img /sdcard/nand/
pause|echo PASS!
goto :menu

:restorebeta
title [BETA] Rostoration: Allwinner
echo.
echo. Restoration!
adb shell "cat /sdcard/nand/nanda.img > /dev/block/nanda; sync"
adb shell "cat /sdcard/nand/nandb.img > /dev/block/nandb; sync"
adb shell "cat /sdcard/nand/nandc.img > /dev/block/nanda; sync"
adb shell "cat /sdcard/nand/nandd.img > /dev/block/nandd; sync"
pause|echo PASS
goto :menu


:restore10
title restore10: Allwinner A10/33 tool by Doctor_Titi
echo.
echo. Avant de continuer, assurez vous lexistence des fichiers dans la tablette en faisant "push10" au menu principal!

SET /P ctn=Voulez-vous continuer? (Y/N): 
 IF /i {%ctn%}=={y} (goto :continue3)
 IF /i {%ctn%}=={n} (goto :menu)

echo. Mauvaise reponse!
pause|echo. OK?
goto :restore10
 
:continue3

echo.
echo /!\ ATTENTION: NE PAS DECONNECTER LE CABLE USB AVANT LA FIN DU PROCESSUS!
echo /!\ ATTENTION: SI VOUS AVEZ MONTE /SYSTEM EN RW, DANS LE MENU FAITES "ro" POUR MOONTER /SYSTEM EN LECTURE SEULE
echo.

SET /P je=Voulez-vous continuer? (Y/N): 
 IF /i {%je%}=={y} (goto :merde)
 IF /i {%je%}=={n} (goto :menu)
 
echo. Mauvaise reponse!
pause|echo. OK?
goto :continue3

:merde 

echo.

goto :DO
:d1
adb shell "cat /mnt/extsd/nand/nanda.img > /dev/block/nanda; sync"
echo.
goto :DO2
title 1 sur 5 Fait: Allwinner A10/33 tool by Doctor_Titi
:d2
adb shell "cat /mnt/extsd/nand/nandb.img > /dev/block/nandb; sync"
echo.
goto :DO3
title 2/5 Fait: Allwinner A10/33 tool by Doctor_Titi
:d3
adb shell "cat /mnt/extsd/nand/nandc.img > /dev/block/nandc; sync"
echo.
goto :DO4
title 3/5 Fait: Allwinner A10/33 tool by Doctor_Titi
:d4
adb shell "cat /mnt/extsd/nand/nandd.img > /dev/block/nandd; sync"
echo.
echo.
goto :DO5
title 4/5 Fait: Allwinner A10/33 tool by Doctor_Titi
:d5
adb shell "busybox sync"
title 5/5 Fait: Allwinner A10/33 tool by Doctor_Titi

:bad
title Recovery:Allwinner A10/33 tool by Doctor_Titi
SET /P arnova=Voulez-vous installer un recovery custom? (Y/N): 
 IF /i {%arnova%}=={y} (GOTO :recovery)
 IF /i {%arnova%}=={n} (GOTO :nope)

echo. Mauvaise reponse!
pause|echo. OK?

goto :bad
 
:nope
title Redemarrer:Allwinner A10/33 tool by Doctor_Titi
echo.
SET /P reboot1=Voulez-vous redemarrer votre tablette? (Recommande)(Y/N): 
 IF /i {%reboot1%}=={y} (goto :rbt)
 IF /i {%reboot1%}=={n} (goto :menu)

echo. Mauvaise reponse!
pause|echo. OK?
goto :nope



:recovery

title Installatoin du Recovery:Allwinner A10/33 tool by Doctor_Titi

echo.
echo. Preparation des dossiers/fichiers sur la tablette...
adb shell "mkdir /mnt/extsd/nand/recovery/"
adb shell "mkdir /mnt/extsd/nand/recovery/cwm/"
adb shell "mkdir /mnt/extsd/nand/recovery/cwm_touch/"
adb shell "mkdir /mnt/extsd/nand/recovery/twrp/"
adb shell "rm /mnt/extsd/nand/recovery"
adb shell "mkdir /mnt/extsd/nand/recovery/"
adb shell "mkdir /mnt/extsd/nand/recovery/cwm/"
adb shell "mkdir /mnt/extsd/nand/recovery/cwm_touch/"
adb shell "mkdir /mnt/extsd/nand/recovery/twrp/"
adb push10 .\files\recovery\reboot-cwm.sh /mnt/extsd/nand/recovery
adb push10 .\files\recovery\reboot-twrp.sh /mnt/extsd/nand/recovery

:aze
echo.
echo.
echo. (1) pour CWM Touch v6.0.1.0 (Recommande)
echo. (2) pour CWM v6.0.2.8
echo. (3) pour TWRP v2.4
echo. (4) pour annuler
echo. (5) pour rebooter votre tablette
echo.
echo.
title Choix Du Recovery:Allwinner A10/33 tool by Doctor_Titi
SET /P choice9=Quelle recovery voulez-vous?: 

IF /i {%choice9%}=={1} (goto :CWM_touch)
IF /i {%choice9%}=={2} (goto :CWM)
IF /i {%choice9%}=={3} (goto :TWRP)
IF /i {%choice9%}=={4} (goto :menu)
IF /i {%choice9%}=={5} (goto :rbt)

echo. Mauvaise reponse!
pause|echo. OK?
goto :aze



:procedure
title Procedure:Allwinner A10/33 tool by Doctor_Titi
echo.
cmd.exe /C .\files\data\show.bat
echo.
pause|echo OK?
goto :menu




:CWM
title Installation de CWM:Allwinner A10/33 tool by Doctor_Titi

adb push10 .\files\recovery\cwm\cwm.img /mnt/extsd/nand/recovery/cwm/
adb push10 .\files\recovery\cwm\install-cwm.sh /mnt/extsd/nand/recovery/cwm/
adb shell "sh /mnt/extsd/nand/recovery/cwm/install-cwm.sh"

goto :rbtrcv2


:rbtrcv2
SET /P lba9=Voulez-vous redemarrer dans le recovery? (Y/N)


IF /i {%lba9%}=={y} (goto :rebootrcv)
IF /i {%lba9%}=={n} (goto :menu)


echo. Mauvaise reponse!
pause|echo. OK?
goto :rbtrcv2

:TWRP
title Installation de TWRP:Allwinner A10/33 tool by Doctor_Titi

adb push10 .\files\recovery\twrp\twrp.img /mnt/extsd/nand/recovery/twrp/
adb push10 .\files\recovery\twrp\install-twrp.sh /mnt/extsd/nand/recovery/twrp/
adb shell "sh /mnt/extsd/nand/recovery/twrp/install-twrp.sh"

goto :rbtrcv2

:CWM_touch
title Installation de CWM Touch:Allwinner A10/33 tool by Doctor_Titi

adb push10 .\files\recovery\cwm_touch\cwm_touch.img /mnt/extsd/nand/recovery/cwm_touch/
adb shell "cat /mnt/extsd/nand/recovery/cwm_touch/cwm_touch.img > /dev/block/nandg"


goto :rbtrcv2

:rw
echo.
echo. montage de /system en ecriture/lecture (RW)...
adb shell "busybox mount -o rw,remount /system"
echo.
pause|echo PASS!
goto :menu

:ro
echo.
echo. montage de /system en lecture seule (RO)...
adb shell "busybox mount -o ro,remount /system"
echo.
pause|echo PASS!
goto :menu


:rebootrcv
title Redemarrage en mode Recovery:Allwinner A10/33 tool by Doctor_Titi
echo.
echo. Redemarrage en mode Recovery...
echo.
adb shell "echo -n boot-recovery | busybox dd of=/dev/block/nandf count=1 conv=sync; sync; reboot"
echo.
echo. Montage de la memoire interne (/emmc)...
echo. PATIENTEZ 30S SVP
timeout /t 30
adb shell "mount -t vfat /dev/block/nandi /emmc"
color 79
pause|echo PASS!
goto :menu

:tp
title TruePart:Allwinner A10/33 tool by Doctor_Titi
echo.
echo. Partitions/points de montage de la tablette:
echo.
adb shell "busybox df -a"
adb shell "sleep 2"
echo.
echo.
adb shell "cat /proc/partitions"
echo.
adb shell "busybox ls -lsha /dev/block"
echo.
pause|echo OK?
goto :menu


:tools
title Boite a outils:Allwinner A10/33 tool by Doctor_Titi
echo.
echo.
echo.
echo. CPU DE LA TABLETTE: 
echo.
adb shell "cat /proc/cpuinfo"
echo.
echo. PARTIIONS SUR LA TABLETTE: 
echo.
adb shell "cat /proc/partitions"
echo.
echo. INFO SUR LA MEMOIRE DE LA TABLETTE: 
echo.
adb shell "cat /proc/meminfo"
echo.
echo. INFO SUR ANDROID/LINUX: 
echo.
adb shell "busybox uname -a"
echo.

pause|echo Appuyez sur une touche pour revenir au menu.
goto :hidden

:bb
echo.
echo Installation de Busybox v42...
echo.
adb install .\files\app\busybox.apk

echo.
echo Installation de SuperSu v2.76...
echo.
adb install .\files\app\su.apk

echo.
echo Installation de Terminal Emulator v1.0.7.0...
echo.
adb install .\files\app\term.apk

echo.
echo Installation de No-Frills CPU Control v1.28.2...
echo.
adb install .\files\app\cpu.apk


pause|echo PASS!
goto :menu

:gapps10
tiitle Installation des Services Google:Allwinner A10/33 tool by Doctor_Titi
echo.
echo. montage de /system en ecriture/lecture (RW)...
echo.
adb shell "busybox mount -o rw,remount /system"

echo. Suppresion des applis qui ne seront plus utilie:

adb shell "rm /system/app/Gallery2.apk"
adb shell "rm /system/app/Provision.apk"
adb shell "rm /system/app/QuickSearchBox.apk"

echo.
echo. Ajout de "addon.d"
echo.
adb shell "mkdir /system/addon.d"
adb push10 .\files\gapps10\system\addon.d\ /system/addon.d\

echo.
echo. Ajout des application Google
echo.
adb install .\files\gapps10\system\gms.apk
adb push10 .\files\gapps10\system\app /system/app

echo.
echo. Ajout synchronisation du dossier "etc"
echo.
adb push10 .\files\gapps10\system\etc /system/etc

echo.
echo. Ajout des frameworks Google
echo.
adb push10 .\files\gapps10\system\framework /system/framework

echo.
echo. Ajout des librairies Google
echo.
adb push10 .\files\gapps10\system\lib /system/lib

echo.
echo. Ajout des TTS
echo.
adb push10 .\files\gapps10\system\tts /system/tts

goto :DO6
:d6
:fe
adb shell "rm /data/dalvik-cache/*"
adb shell "busybox sync"
goto :ro



	:spinner1
	set /a "spinner=(spinner + 1) %% 4"
	set "spinChars=\|/-"
	<nul set /p ".= Chargement du bootloader10 sur /dev/block/nanda...  !spinChars:~%spinner%,1!!CR!"
	exit /b
	
	:spinner2
	set /a "spinner=(spinner + 1) %% 4"
	set "spinChars=\|/-"
	<nul set /p ".= Chargement de Environement sur /dev/block/nandb...  !spinChars:~%spinner%,1!!CR!"
	exit /b
	
	:spinner3
	set /a "spinner=(spinner + 1) %% 4"
	set "spinChars=\|/-"
	<nul set /p ".= Chargement du Kernel sur /dev/block/nandc...  !spinChars:~%spinner%,1!!CR!"
	exit /b
	
	:spinner4
	set /a "spinner=(spinner + 1) %% 4"
	set "spinChars=\|/-"
	<nul set /p ".= Chargement du System sur /dev/block/nandd (/system)...  !spinChars:~%spinner%,1!!CR!"
	exit /b
	
	:spinner5
	set /a "spinner=(spinner + 1) %% 4"
	set "spinChars=\|/-"
	<nul set /p ".= Finalisation... (syncing)  !spinChars:~%spinner%,1!!CR!"
	exit /b
	
	:spinner6
	set /a "spinner=(spinner + 1) %% 4"
	set "spinChars=\|/-"
	<nul set /p ".= Finalisation...  !spinChars:~%spinner%,1!!CR!"
	exit /b


:DO
	@echo off
	setlocal EnableDelayedExpansion
	for /f %%a in ('copy /Z "%~dpf0" nul') do set "CR=%%a"
	
	FOR /L %%n in (1,1,10) DO (
		call :spinner1
		ping localhost -n 2 > nul
	)
	goto :d1
	exit /b
	
	
:DO2
	@echo off
	setlocal EnableDelayedExpansion
	for /f %%a in ('copy /Z "%~dpf0" nul') do set "CR=%%a"
	
	FOR /L %%n in (1,1,10) DO (
		call :spinner2
		ping localhost -n 2 > nul
	)
	goto :d2
	exit /b
	

:DO3
	@echo off
	setlocal EnableDelayedExpansion
	for /f %%a in ('copy /Z "%~dpf0" nul') do set "CR=%%a"
	
	FOR /L %%n in (1,1,10) DO (
		call :spinner3
		ping localhost -n 2 > nul
	)
	goto :d3
	exit /b
	

:DO4
	@echo off
	setlocal EnableDelayedExpansion
	for /f %%a in ('copy /Z "%~dpf0" nul') do set "CR=%%a"
	
	FOR /L %%n in (1,1,10) DO (
		call :spinner4
		ping localhost -n 2 > nul
	)
	goto :d4
	exit /b

:DO5
	@echo off
	setlocal EnableDelayedExpansion
	for /f %%a in ('copy /Z "%~dpf0" nul') do set "CR=%%a"
	
	FOR /L %%n in (1,1,10) DO (
		call :spinner5
		ping localhost -n 2 > nul
	)
	goto :d5
	exit /b
	
:DO6
	@echo off
	setlocal EnableDelayedExpansion
	for /f %%a in ('copy /Z "%~dpf0" nul') do set "CR=%%a"
	
	FOR /L %%n in (1,1,10) DO (
		call :spinner6
		ping localhost -n 2 > nul
	)
	goto :d6
	exit /b
	
:debloat10
echo. Suppression en cours...
echo.
echo. montage de /system en ecriture/lecture (RW)...
adb shell "busybox mount -o rw,remount /system"
echo.
echo. Suppression de "Update"
adb shell "rm /system/preinstall/Update.apk"
adb shell "rm /data/app/com.softwinner.update-1.apk"
adb shell "rm -r /data/data/com.softwinner.update"
echo.
echo. Suppression de "AppsLib"
adb shell "rm /system/preinstall/Appslib_76.apk"
adb shell "rm /data/app/com.appslib.vending-1.apk"
adb shell "rm -r /data/data/com.appslib.vending"
echo. Suppression de "Talk"
adb shell "rm /system/app/Talk.apk"
echo. Suppression de "Maps"
adb shell "rm /system/app/Maps.apk"
goto :fe



:rbt
color 3B
title Menu de redemarrage:Allwinner A10/33 tool by 
echo.
echo. (1) Simple reboot (fonctionne dans le Recovery et dans Android)
echo. (2) Reboot en mode Recovery (depuis Android)
echo. (3) Reboot en Fastboot (fonctionne dans le Recovery et dans Android)
echo. (4) Reboot en mode normal (depuis Fastboot)
echo. (5) retour
echo.
SET /P rbt_var=Dans quel mode voulez-vous (re)demarrer?: 


IF /i {%rbt_var%}=={1} (goto :rbt1)
IF /i {%rbt_var%}=={2} (goto :rbt2)
IF /i {%rbt_var%}=={3} (goto :rbt3)
IF /i {%rbt_var%}=={4} (goto :rbt4)
IF /i {%rbt_var%}=={5} (goto :rbt5)

pause|echo. Mauvais choix!
goto :rbt



:rbt1
echo.
echo. Redemarrage en cours...
echo.
adb shell "reboot"
color 79
pause|echo PASS!
goto :rbt

:rbt2
echo.
echo. Redemarrage en Recovery en cours...
echo.
goto :rebootrcv

:rbt3
echo.
echo. Redemarrage en Fastboot en cours...
echo.
adb shell "echo -n boot-fastboot | busybox dd of=/dev/block/nandf count=1 conv=sync; sync; reboot"
color 79
pause|echo PASS!
goto :rbt


:rbt4
echo.
echo. Demarrage en cours...
echo.
fastboot reboot
color 79
pause|echo PASS!
goto :rbt

:rbt5
goto :menu
	
:rcvwipe
title Recovery Menu:Allwinner A10/33 tool by Doctor_Titi
echo.
echo. Utiliser votre Recovery sans le tactile ou les bouttons grace a ce tool ;) (TWRP & CWM)
echo.
echo.
echo. (1) Efface /data
echo. (2) Efface /cache
echo. (3) Efface /system
echo. (4) "Full Wipe" -- Efface /cache et /data
echo. (5) "preinstallation" -- Efface /system, /data et /cache, utile pour installer une Rom Custom
echo. (5) Retour au menu
echo.

SET /P wipe=Que voulez-vous faire?: 

IF /i {%wipe%}=={1} (goto :wipe1)
IF /i {%wipe%}=={2} (goto :wipe2)
IF /i {%wipe%}=={3} (goto :wipe3)
IF /i {%wipe%}=={4} (goto :wipe4)
IF /i {%wipe%}=={5} (goto :menu)

pause|echo Mauvaise reponse!
goto :rcvwipe

:wipe1
adb push10 .\files\recovery\command\1\command /cache/recovery/
pause
adb shell "echo -n boot-recovery | busybox dd of=/dev/block/nandf count=1 conv=sync; sync; reboot"
pause|echo PASS!
goto :rcvwipe

:wipe2
adb push10 .\files\recovery\command\2\command /cache/recovery/
pause
adb shell "echo -n boot-recovery | busybox dd of=/dev/block/nandf count=1 conv=sync; sync; reboot"
pause|echo PASS!
goto :rcvwipe

:wipe3
adb push10 .\files\recovery\command\3\command /cache/recovery/
pause
adb shell "echo -n boot-recovery | busybox dd of=/dev/block/nandf count=1 conv=sync; sync; reboot"
pause|echo PASS!
goto :rcvwipe

:wipe4
adb push10 .\files\recovery\command\4\command /cache/recovery/
pause
adb shell "echo -n boot-recovery | busybox dd of=/dev/block/nandf count=1 conv=sync; sync; reboot"
pause|echo PASS!
goto :rcvwipe

:bootloader10
titlz Flash du bootloader10 stock:Allwinner A10/33 tool by Doctor_Titi
echo.
SET /P btl=Voulez-vous vraiment flasher le bootloader10? (Y/N)

IF /i {%btl%}=={n} (goto :menu)
IF /i {%btl%}=={y} (goto :btl1)

pause|echo Mauvaise reponse!
goto :bootloader10

:btl1
echo.
echo. Eciture du bootloader10 en cours...
echo.
adb push10 .\files\nand\nanda.img /mnt/extsd/nand/
adb push10 .\files\nand\nandb.img /mnt/extsd/nand/
adb shell "cat /mnt/extsd/nand/nanda.img > /dev/block/nanda"
adb shell "cat /mnt/extsd/nand/nandb.img >/dev/block/nandb"
goto :recovery


:TheEnd?
pause|echo "U Wot M8?!"