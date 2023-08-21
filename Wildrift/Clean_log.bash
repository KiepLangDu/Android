#### Clean Replays
# On android 12 and above you need root permission to access /sdcard/Android/data
#ALWAYS REMEMBER TO CHECK PATH OF DIRECTORIES ON YOUR STORAGE BEFORE RUN THIS CODE
Start(){
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
	alias ls='ls 2> /sdcard/log.txt'
	cd /sdcard/Android/data/com.riotgames.league.wildriftvn/files/Log/
	rm $(ls -t *.log | grep -v $(ls -t *.log | head -n 1)) 2> /sdcard/log.txt
	if [[ $? -eq 0 ]]
	then
		echo "Logs are cleaned"
	else
		echo "Your logs are ready cleaned before"
	fi
}
Start
#unalias ls
alias |grep ls
#echo "This result will clear after 5 seconds"
#ping -c 5 127.0.0.1 > /sdcard/log.txt
#clear
rm /sdcard/log.txt
