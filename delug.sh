#!/bin/bash
counter=1
clear
echo "Want to delete users or groups ?"
echo "-- u/g --"
read dec1

#USER

if [ "$dec1" = "u" ];then
while [ $counter -le 50 ]
do
	clear
		echo ""
	echo " TO EXIT PRESS CTRL + C "
		echo ""
	echo " ********************************************** "
	
	tail -n 5 /etc/passwd
		echo ""
	echo " ********************************************** "
		echo " "
		echo " "
	echo " TYPE THE USERNAME TO DELETE "
			read user
			userdel -r $user 
	clear
#	tail -n 5 /etc/passwd
done
fi

#GROUP

if [ "$dec1" = "g" ];then
while [ $counter -le 50 ]
do
	clear
		echo ""
	echo " TO EXIT PRESS CTRL + C "
		echo ""
	echo " ********************************************** "
	
	tail -n 5 /etc/group
		echo ""
	echo " ********************************************** "
		echo " "
		echo " "
	echo " TYPE THE GROUPNAME TO DELETE "
			read group
			groupdel $group 
	clear
#	tail -n 5 /etc/group
done
fi






#userdel
exit 0
