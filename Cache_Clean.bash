Start(){
	echo "Clear cache"
	rm -rf $(find /data/data/ -name cache |grep focus)
	rm -rf $(find /data/data/ -name cache |grep zalo)
	rm -rf $(find /data/data/ -name cache |grep revanced| head -n 1)
	rm -rf $(find /data/data/ -name cache |grep revanced| tail -n 1)
	rm -rf $(find /data/data/ -name cache |grep photo)
	rm -rf $(find /data/data/ -name cache |grep chotot)
	rm -rf $(find /data/data/ -name cache |grep vending)
	rm -rf $(find /data/data/ -name cache |grep duolingo)
	echo "Done"
}
Start
