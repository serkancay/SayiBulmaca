#!/bin/bash

if [ -n "$1" ]; then
if [ $1 == "-help" ]; then
	echo -e "	--------------------------------"
	echo -e "	|	SAYI BULMACA v1.0	|"
	echo -e "	|				|"
	echo -e "	|    gelistirici: S.Serkan Cay	|"
	echo -e "	--------------------------------"
	echo -e "Rastgele belirlenen sayiyi tahmin etmeye calisin!\n"
	echo -e "kullanim: ./sayibulmaca.sh -a [MINDEGER] -u [MAXDEGER]"
	echo -e "Eger min ve max deger belitmezseniz varsayilan olarak 1-100 alinir\n"
	echo -e "  -a	Tahmin edilecek sayi alt siniri"
	echo -e "  -u 	Tahmin edilecek sayi ust siniri"
	exit 1
fi
fi

while getopts a:u:help: option
do
case "${option}"
in
a) MIN=${OPTARG};;
u) MAX=${OPTARG};;
*) echo -e "Argument girmeyi unutmayin"; exit 1 ;;
esac
done

if [ -z "$MIN" ]; then 
	MIN=0
fi

if [ -z "$MAX" ]; then
	MAX=100
fi
	
if [ "$MIN" -gt "$MAX" ]; then
	echo -e "Ust sinir alt sinirdan kucuk olamaz!"
	exit 1
fi

SUM=1
NUM=$(( RANDOM % ( $MAX - $MIN + 1 ) + $MIN ))

echo -e "Hadi baslayalim!\nBir sayi girin >"
read input_variable

while [ ! "$NUM" -eq "$input_variable" ]; do
	SUM=$(($SUM + 1))
	if [ "$input_variable" -gt "$NUM" ]; then
		echo -e "Daha kucuk bir sayi girin >"
	else echo -e "Daha buyuk bir sayi girin >"
	fi
	read input_variable
done
echo -e "	      --------------"
echo -e "	      |	Tebrikler! |"
echo -e "	      --------------"
echo -e " 	$SUM denemede bildiniz..."
echo -e " 	Tuttugum sayi $NUM"	
