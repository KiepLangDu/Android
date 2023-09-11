#Delete /data/data/ *appname*/cache 
#Run with root
#
#
Start(){
	clear
	echo "This shell is to remove cache in /data/data/*appname*/cache. Please wait until the shell counts the number of total directories "
	limit=$(find /data/data/ -name cache  |wc -l)
	quater=$(expr $limit / 4)
	half=$(expr $limit / 2)
	three_quater=$(expr $quater \* 3)

	echo " The number of cache directory will be remove is: $limit \nDo you want to remove them (y) or (n)"
	read flag
	Clean(){
		x=1
		while [ $x -le $limit ]
		do
			flag=$(find /data/data/ -name cache |head -n $x | tail -n 1)
			if [[ $x -eq $quater ]]
			then
				echo "Your progress is 25%\nCurrent flag is: $flag"
			elif [[ $x -eq $half ]]
			then
				echo "Your progress is 50%\nCurrent flag is: $flag"
			elif [[ $x -eq $three_quater ]]
			then
				echo "Your progress is 75%\nCurrent flag is: $flag"
			elif [[ $x -eq $limit ]]
			then
				echo "Your progress is 100%\nFinal flag is: $flag"
			fi
			#echo "Removing:  $flag"
			rm -rf $flag
			x=$(($x+1))
		done
		echo "Done!"
	}
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
Start
