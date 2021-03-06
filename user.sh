#!/bin/bash

#useradd, modifid id, rights
clear

echo "## Want to add user ? ##"									#useradd
echo " "
echo "-- y/n --"
echo " "
read theny

if [ "$theny" = "y" ]; then
	echo " "
	echo "************************************************************************"
	echo "Type username:"
	read username
	useradd $username
	if [ "$theny" = "n" ]; then 
		echo "***********************************************************************"
		echo "User has not been added. " 
		echo " "
	fi
fi

clear
#cat /etc/passwd | grep $username
#id $username
echo ""
echo "************************************************************************"			#usermod-GID-UID
echo "## Want to modify UID and GID? ##"
echo "	"
echo "-- y/n --"
echo " "
read uidy
echo " "
clear

if [ "$uidy" = "y" ]; then
	tail -n 5 /etc/passwd
	echo " "
	echo "User modification for username: "
	read username
	echo " "
#	tail -n 5 /etc/passwd
#	echo "***********************************"
#	echo " "
#	tail -n 5 /etc/passwd
	echo "***********************************"
	echo "	Type desired UID	"
		read uid
	usermod -u $uid	$username
	
	echo "***********************************"
	echo "	Type desired group name and GID	"
		read gname	
		read gid
	groupadd -g $gid $gname
	usermod	-g $gid $username
	echo "***********************************"
		echo " "
	echo "OPEREATION SUCCESSFUL"
		echo " "
	if [ "$uidy" = "n" ]; then
		echo "Modification not chosen"
		echo " "
	fi
#clear
fi

cat /etc/passwd | grep $username
echo ""
id $username
echo ""
cat /etc/group | grep $username
echo ""
echo ""
echo "*******************************************"
echo "## Want to add comment for the user ? ##"							#comment
	echo " "

echo "-- y/n --"

read comy
clear
if [ $comy = "y" ];then
		clear
	echo " "
	echo "*******************************************"
	echo "User comment for username: "
	read username
		echo " "
	echo "Desired comment: "
	read comment
usermod -c $comment $username
else 
echo "Comment not chosen."
echo ""
fi
clear
echo "*******************************************"
echo "Want to change shell ?"									#shell
echo " "
echo "-- y/n --"
read shy
if [ "$shy" = "y" ]; then
#		clear
	echo "Available shells: "
	echo " "
cat /etc/shells
echo " "
echo "*******************************************"
echo " "
echo "Shell change for username: "
read username
echo " "
echo "Choose a shell, for example sh, bash. "
echo ""
read shelld
if [ "$shelld" = "sh" ];then
	usermod -s /bin/sh $username
	echo "Shell change for user - $username to shell - sh"
	cat /etc/passwd | grep $username
fi

if [ "$shelld" = "bash" ];then
	usermod -s /bin/bash $username
	echo "Shell change for user - $username to shell - bash"
	cat /etc/passwd | grep $username
fi

if [ "$shelld" = "nologin" ];then
	usermod -s /sbin/nologin $username
	echo "Shell change for user - $username to shell - nologin"
	cat /etc/passwd | grep $username
fi

if [ "$shelld" = "dash" ];then
	usermod -s /bin/dash $username
	echo "Shell change for user - $username to shell - dash"
	cat /etc/passwd | grep $username
fi

if [ "$shelld" = "tcsh" ];then
	usermod -s /bin/tcsh $username
	echo "Shell change for user - $username to shell - tcsh"
	cat /etc/passwd | grep $username
fi

if [ "$shelld" = "csh" ];then
	usermod -s /bin/csh $username
	echo "Shell change for user - $username to shell - csh"
	cat /etc/passwd | grep $username
fi

else
echo "Shell change not chosen."
fi	
echo "*******************************************"
echo " "	
echo " 		**********	     "
echo "*******************************"
echo "*      Alpha 1.0 @dano        *"
echo "*******************************"
echo " "
echo " "


exit 0
