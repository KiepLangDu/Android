#Delete /data/data/ *appname*/cache 
#Run with root
#
#
Start(){
	Testing
	clear
	echo "This shell is to remove cache in /data/data/*appname*/cache. Please wait until the shell counts the number of total directories "
	limit=$(find /data/data/ -name cache  |wc -l)
	quater=$(expr $limit / 4)
	half=$(expr $limit / 2)
	three_quater=$(expr $quater \* 3)

	echo "The number of cache directory will be remove is: $limit \nDo you want to remove them (y) or (n)"
	read flag
	Case
}
Clean(){
	x=1
	while [ $x -le $limit ]
	do
		flag=$(find /data/data/ -name cache |head -n $x | tail -n 1)
		if [[ $x -eq $quater ]]
		then
			sed -i '9s/.*/\t\tif [[ $x -eq 0 ]]/' Showing.bash
			printf "Your progress is 25%%. \nCurrent flag is: $flag \n"
			./Showing.bash
		elif [[ $x -eq $half ]]
		then
			sed -i '9s/.*/\t\tif [[ $x -eq 0 || $y -eq 0 ]]/' Showing.bash
			printf  "Your progress is 50%%. \nCurrent flag is: $flag \n"
			./Showing.bash
		elif [[ $x -eq $three_quater ]]
		then
			sed -i '9s/.*/\t\tif [[ $x -eq 0 || $y -eq 0 || $x -eq $limit ]]/' Showing.bash
			printf "Your progress is 75%%. \nCurrent flag is: $flag \n"
			./Showing.bash
		elif [[ $x -eq $limit ]]
		then
			printf "Your progress is 100%%. \nFinal flag is: $flag \n"
			Showing
		fi
		#echo "Removing:  $flag"
		rm -rf $flag
		x=$(($x+1))
	done
	echo "Done!"
	Finish
}
Case(){

	case $flag in
		y)
			echo "You chose to remove all cache"
			Clean
			;;
		n)
			echo "You chose to cancel"
			exit
			;;
		*)
			clear
			echo "Your input is wrong"
			Start
			;;
	esac
}
################## Showing progress ###############
Showing(){
	x=0
	limit=15
	while [ $x -le $limit ]
	do
		y=0
		while [ $y -le $limit ]
		do
			if [[ $x -eq 0 || $y -eq 0 || $x -eq $limit || $y -eq $limit ]]
			then
				printf "*"
			else
				printf " "
			fi
			y=$(($y+1))
		done
		printf "\n"
		x=$(($x+1))
	done
}
################# End of Showing progress ##########
Testing(){
	cat Cache_Clean.bash | head -n 88 | tail -n 20 > Showing.bash
	chmod +x Showing.bash
	echo Showing >> Showing.bash	
}
Finish(){
	rm -rf Showing.bash
}
Start
