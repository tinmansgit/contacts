#!/usr/bin/bash .... for FreeBSD change path to /usr/local/bin/bash
# Contact list, data stored in .phonelist.txt

PHONELIST=~/.phonelist.txt

if [ $# -lt 1 ] ; then
	echo "Contact Name? "
	exit 1
fi

if [ $1 = "new" ] ; then
	shift
	echo $* >> $PHONELIST
	echo $* added to database
	exit 0
fi

if [ ! -s $PHONELIST ] ; then
	echo "No Contacts in list. "
	exit 1
	else
	grep -i -q "$*" $PHONELIST
	if [ $? -ne 0 ] ; then
		echo "Contact not found. "
		exit 1
	else 
		echo " "
		grep -i "$*" $PHONELIST
		echo " "
	fi
fi
exit 0
