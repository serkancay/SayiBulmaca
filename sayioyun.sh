#!/bin/bash

while getopts a:u:help: option
do
case "${option}"
in
a) MIN=${OPTARG};;
u) MAX=${OPTARG};;
esac
done
SUM=1
NUM=$(( RANDOM % ($MAX - $MIN + 1) + $MIN ))
echo -e "NUM: $NUM"

echo -e "Hadi baslayalim!\nBir sayi girin >"
read input_variable

while [ ! "$NUM" -eq "$input_variable" ]; do
	SUM=$($SUM+1)
	if [ "$input_variable" -gt "$NUM" ]; then
		echo -e "Daha kucuk bir sayi girin >"
	else echo -e "Daha buyuk bir sayi girin >"
	fi
	read input_variable
done

echo -e "Tebrikler!\n*Sayimiz: $NUM\n$SUM denemede bildiniz!"
