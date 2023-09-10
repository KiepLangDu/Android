#Delete /data/data/ *appname*/cache 
#Run with root
#
#
Start(){
	echo "This shell is to remove cache in /data/data/*appname*/cache. Please wait until the shell counts the number of total directories "
	limit=$(find /data/data/ -name cache  |wc -l)
	echo " The number of cache directory will be remove is: $limit \nDo you want to remove them (y) or (n)"
	read flag
	Clean(){
		x=1
		while [ $x -le $limit ]
		do
			flag=$(find /data/data/ -name cache |head -n $x | tail -n 1)
			echo "Removing:  $flag"
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
