#!/usr/bin/bash 
# FreeBSD change path to /usr/local/bin/bash
# Contact list data stored in .contact_list.txt

CONTACT_LIST=~/.contact_list.txt

if [ $# -lt 1 ] ; then
	echo "Contact Name? "
	exit 1
fi

if [ $1 = "add" ] ; then
	shift
	echo $* >> $CONTACT_LIST
	echo $* " added." 
	exit 0
fi

if [ ! -s $CONTACT_LIST ] ; then
	echo "No contacts added. "
	exit 1
	else
	grep -i -q "$*" $CONTACT_LIST
	if [ $? -ne 0 ] ; then
		echo "Contact not found. "
		exit 1
	else 
		echo " "
		grep -i "$*" $CONTACT_LIST
		echo " "
	fi
fi
exit 0
