#### Clean Replays
cd /sdcard/Android/data/com.riotgames.league.wildriftvn/files/Replays/4000300699301/882728827094849141/
rm $(ls -t | grep -v $(ls -t |head -n 1)) 2> /sdcard/log.txt
if [[ $? -eq  0 ]]
	then
		echo "Replays are cleaned"
	else
		echo "Your replays are ready cleaned before"
fi
### Clean Log
cd /sdcard/Android/data/com.riotgames.league.wildriftvn/files/Log/
rm $(ls -t *.log 2> /sdcard/log.txt | grep -v 2> /sdcard/log.txt $(ls -t *.log 2> /sdcard/log.txt| head -n 1)) 2> /sdcard/log.txt
if [[ $? -eq 0 ]]
	then
		echo "Logs are cleaned"
	else
		echo "Your logs are ready cleaned before"
fi
rm /sdcard/log.txt