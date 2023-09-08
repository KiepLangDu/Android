#Delete /data/data/ *appname*/cache 
#Run with root
#
#
limit=$(find /data/data/ -name cache  |wc -l)
#echo $limit
x=1
while [ $x -le $limit ]
do
	flag=$(find /data/data/ -name cache |head -n $x | tail -n 1)
	echo "Removing:  $flag"
	rm -rf $flag
	x=$(($x+1))
done
echo "Done!"
