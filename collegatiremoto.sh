#! /bin/bash

# lo script verifica la presenza di una copia di chiavi ssh
#+ eventualmente ne crea un dopo di che su un server remoto crea un utente
#+ ne abilita la connessione ssh e gli carica la chiave pubblica generata
#+ precedentemente per consentire l'acceso senza password   

source ./.env



main() {
  # lo script verifica la presenza di una copia di chiavi ssh
  ris=`ls ~/.ssh/*.pub | wc -l`
  if (( $ris == 0 )) ; then
    # se non c'è ne crea una 
    ssh-keygen -b 2048 -t ed25519 -q -N ""
  fi

  # collegarsi al server remoto per creare un nuovo utente abilitato alla connessione ssh 
  #ssh root@$hostIp 
  #if [ $(id -u) -eq 0 ]; then
	#egrep "^$newUserName" /etc/passwd >/dev/null
	#if [ $? -eq 0 ]; then
		#echo "$newUserName exists!"
		#exit 1
	#else
		#pass=$(perl -e 'print crypt($ARGV[0], "password")' $newUserPwd)
		#useradd -m -p "$pass" "$newUserName"
		#[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
	#fi
#else
	#echo "Only root may add a user to the system."
	#exit 2
#fi
  
  # caricare la chiave pubblica sul server remoto e testare la connessione 
}

main

 ################################################
#for n in {1..5}
#do
#  echo "Welcome $n times"
#  if [ `expr $n % 2` == 0 ]; then
#	echo "$n is even"
#  else
#	echo "$n is Odd"
#  fi
#done


exit 0
