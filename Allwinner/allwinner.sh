#!/bin/bash

case $1 in


#version
        "-version" | "-v" | "--version")
		#affiche les info de "allwinner".
                echo -e "Allwinner Tool By \e[91mD\e[33mo\e[93mc\e[92mt\e[94mo\e[35mr\e[39m_Titi for Linux"
				echo -e "\e[39mVersion 0.0.6 ALPHA"
                ;;
		
#help
        "-help")
		#Affiche ma miste de commande dispo
			cat hlp
			;;

#partition theorique

	"partition")
	#Affiche les partitions théorique
		cat part
		;;
	
#ADB

	"adb")
	#Installe les paquets android-tools*
		sudo apt-get install android-tools*
		;;


#usage

        *)
	#explication
        echo "Usage: allwinner [-version] [-help]"
	#salutation
		echo "Hey, salut $USERNAME!"
        ;;

esac

#EOF