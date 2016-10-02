#!/bin/bash
clear
#déclaration des fonctions

function delete
	{
	echo "Suppression en cours..."
	rm /bin/allwinner
	rm /bin/hlp
	rm /bin/part
	
	echo "Vérification si les fichiers on été bien supprimé..."
	
	if [ -f /bin/allwinner ]
		then
			echo "1/3 Vérifié"

	fi
	
	if [ -f /bin/hlp ]
		then
			echo "2/3 Vérifié"

	fi
	
	if [ -f /bin/part ]
		then
			echo "3/3 Vérifié"

	fi
	
	echo -e "\e[92mDésinstallation terminé!"
	}

function uninstall
	{
	read -p "Voulez-vous vraiment désinstaller ce programme? (Y/N) :" uninstallquestion
	if [ $uninstallquestion == Y ] || [ $uninstallquestion == y ] || [ $uninstallquestion == yes ] || [ $uninstallquestion == YES ]
		then
			delete
			wait
			./install.sh
		else 
			./install.sh
	fi
	}
	
function wtf
	{
	echo -e "\e[91mERREUR \e[91mFATAL\e[91m! \e[91mCONTACTEZ \e[91mLE \e[91mCRéATEUR \e[91mDE \e[91mCE \e[91mLOGICIEL \e[91mAVEC \e[91mVOS \e[91mLOGS"
	
	}

function congratulation
	{
	echo -e "\e[92mCongratulation\e[92m! \e[92mL\e[92m'\e[92minstallation \e[92ms\e[92m'\e[92mest \e[92mdéroulé \e[92mcorrectement\e[92m!"
	echo -e "\e[39m"
	
	}
	
function missing
	{
	echo -e "\e[91mERREUR\e[91m: \e[91mUn \e[91mou \e[91mplusieurs \e[91mfichier \e[91msont \e[91mmanquant\e[91m! \e[91mAbondon\e[91m!"
	
	./install.sh
	}

function updating
	{
	clear
	echo "Suppression de l'ancienne version..."
	rm /bin/allwinner
	rm /bin/hlp
	rm /bin/part
	rm /bin/cmd
	echo "copie de la nouvelle version"
	cp ./allwinner /bin/
	cp ./part /bin/
	cp ./hlp /bin/
	echo "Copie Terminé!"
	sleep 1 | echo "Vérification des données copié"
	
	if [ -f /bin/allwinner ]
		then
			echo "1/3 Vérifié"
			chmod 775 /bin/allwinner
		else
			echo "allwinner est manquant!"
	fi
	
	if [ -f /bin/hlp ]
		then
			echo "2/3 Vérifié"
			chmod 775 /bin/hlp
		else
			echo "hlp est manquant!"
	fi
	
	if [ -f /bin/part ]
		then
			echo "3/3 Vérifié"
			chmod 775 /bin/part
			congratulation
		else
			echo "part est manquant!"
			missing
	fi
	
	}

function wait
	{
	sleep 1 | echo -n "."
	sleep 1 | echo -n "."
	sleep 1 | echo -n "."
	echo
	}

function print_ver
	{
	bash ./allwinner -v | grep Version
	}

function print_current_ver
	{
	allwinner --version | grep Version
	}

function detect
	{
	echo "Detection d'une précédente installation..."
	wait
	
	if [ -f /bin/allwinner ]
	
	then
		echo "La version: "; print_current_ver; echo "est déja installé."
		update
	else
		echo -e "\e[93mAucune \e[93minstallation \e[93mn\e[93m'\e[93ma \e[93mété \e[93mtrouvé\e[93m."
		
		read -p "Voulez-vous l'installer maintenant? (Y/N) :" newinstall
		echo -e "\e[39m"
		
		if [ $newinstall == Y ] || [ $newinstall == y ] || [ $newinstall == YES ] [ $newinstall == yes ] || [ $newinstall == o ] || [ $newinstall == O ]
			then
				updating
			else
				./install.sh
		fi
	fi
	
	}
	
function update
	{
	echo "Mettre à jour de"
	print_current_ver
	echo -n	"vers la "
	print_ver
	echo -n "?"
	echo
	read -p 'Voulez-vous mettre à jour maintenant? (Y/N)' update
	
	if [ $update == Y ] || [ $update == y ] || [ $update == YES ] [ $update == yes ] || [ $update == o ] || [ $update == O ]
	
	then
		updating 
	else
		./install.sh
	fi
	
	}
	
#Vérification de l'acces root	

	if [ $USER == root ]
	
	then
		print_ver > /dev/null
	else
		echo "Vous devez être root!"
		exit
fi

echo -e "\e[39mBienvenue dans l'installation de Allwinner Tool By \e[91mD\e[33mo\e[93mc\e[92mt\e[94mo\e[35mr\e[39m_Titi for Linux"
print_ver
echo

echo -e "install --> Met à jour ou installe Allwinner Tool By \e[91mD\e[33mo\e[93mc\e[92mt\e[94mo\e[35mr\e[39m_Titi for Linux "
echo -e "uninstall --> Désinstalle Allwinner Tool By \e[91mD\e[33mo\e[93mc\e[92mt\e[94mo\e[35mr\e[39m_Titi for Linux"
echo -e "exit --> quitte l'installation"
echo
read -p 'Que voulez-vous faire? :' question


if [ $question == install ]
	then
		detect
		wait
		wait
		./install.sh
fi

if [ $question == uninstall ]
	then
		uninstall
		wait
		wait
		./install.sh
fi

if [ $question == exit ]
	then
		exit
	else
		./install.sh
		wtf
fi
#EOF