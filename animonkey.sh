#!/bin/bash


declare -a shots
declare STR_NUM
declare FILE_NAME
PATH_TO_ANIMATION="/home/cat/nikiras_birthday/"

spin(){
	for k in 1 2 3
	do
		for i in "${shots[@]}"
		do
			echo -ne "$i"
			echo -e "\033["$STR_NUM"A"
			sleep 0.15
		done
	done
}


work(){
	mapfile -d "~" -t shots < $FILE_NAME
	spin
	sleep 0.1
	echo -e "\033["$STR_NUM"B"

}


cases(){
	case $1 in
	
	docker)
		STR_NUM=8
		FILE_NAME="${PATH_TO_ANIMATION}docker.txt"
		;;

	cat)
		STR_NUM=7
		FILE_NAME="${PATH_TO_ANIMATION}cat.txt"
		;;	

	cd)
		STR_NUM=9
		FILE_NAME="${PATH_TO_ANIMATION}cd.txt"
		;;

	ls)
		STR_NUM=5
		FILE_NAME="${PATH_TO_ANIMATION}ls.txt"
		;;

	hi)
		STR_NUM=13
		FILE_NAME="${PATH_TO_ANIMATION}witch.txt"
		;;

	python | python3)
		STR_NUM=13
		FILE_NAME="${PATH_TO_ANIMATION}python.txt"
		;;

	*)
		STR_NUM=7
		FILE_NAME="${PATH_TO_ANIMATION}heart.txt"
		;;

	esac
}

cases "$@"
work
exec "${@:1}"	
