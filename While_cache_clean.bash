#Delete /data/data/ *appname*/cache except for system
#Only run with root
#
#
limit=$(find /data/data/ -name cache |grep -v system |wc -l)
#echo $limit
x=1
while [ $x -le $limit ]
do
	flag=$(find /data/data/ -name cache |grep -v system |head -n $x | tail -n 1)
	echo "Current flag is:  $flag"
	#rm -rf $flag
	x=$(($x+1))
done

