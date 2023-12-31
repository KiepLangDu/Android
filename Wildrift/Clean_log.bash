#### Clean Replays
# On android 12 and above you need root permission to access /sdcard/Android/data
#ALWAYS REMEMBER TO CHECK PATH OF DIRECTORIES ON YOUR STORAGE BEFORE RUN THIS CODE
Start(){
	alias ls='ls 2>/sdcard/log.txt'
	echo "Clean replays and logs except for the last one \n"
	Replays
}

Replays(){
	### Clean Replays
	cd /sdcard/Android/data/com.riotgames.league.wildriftvn/files/Replays/*/*/
	rm $(ls -t | grep -v $(ls -t |head -n 1)) 2> /sdcard/log.txt
	if [[ $? -eq  0 ]]
	then
		echo "Replays are cleaned"
	else
		echo "Your replays are ready cleaned before"
	fi
Logs
}

Logs(){
	### Clean Logs
	cd /sdcard/Android/data/com.riotgames.league.wildriftvn/files/Log/
	rm $(ls -t *.log | grep -v $(ls -t *.log | head -n 1)) 2> /sdcard/log.txt
	if [[ $? -eq 0 ]]
	then
		echo "Logs are cleaned"
	else
		echo "Your logs are ready cleaned before"
	fi
Dalvik
}

Dalvik(){
	echo "Delete Dalvik-cache"
	flag=$(ls -l /data/dalvik-cache|wc -l)
	if [[ $flag -eq 1 ]]
	then 
		echo "Dalvik-cahe are cleaned before"
	else
		rm -rf /data/dalvik-cache/*
		echo "Dalvik-cache are clean"
	fi
}
Start
unalias ls
rm /sdcard/log.txt
