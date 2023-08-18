#### Clean Replays
# On android 12 and above you need root permission to access /sdcard/Android/data
#ALWAYS REMEMBER TO CHECK PATH OF DIRECTORIES ON YOUR STORAGE BEFORE RUN THIS CODE
echo "Clean replays and logs except for the last one \n"
#cd /sdcard/Android/data/com.riotgames.league.wildriftvn/files/Replays/4000300699301/882728827094849141/
cd /sdcard/Android/data/com.riotgames.league.wildriftvn/files/Replays/*/*/
rm $(ls -t | grep -v $(ls -t |head -n 1)) 2> /sdcard/log.txt
if [[ $? -eq  0 ]]
	then
		echo "Replays are cleaned"
	else
		echo "Your replays are ready cleaned before"
fi
### Clean Log
cd /sdcard/Android/data/com.riotgames.league.wildriftvn/files/Log/
rm $(ls -t *.log| grep -v $(ls -t *.log | head -n 1)) 2> /sdcard/log.txt
if [[ $? -eq 0 ]]
	then
		echo "Logs are cleaned"
	else
		echo "Your logs are ready cleaned before"
fi
rm /sdcard/log.txt
echo "\nDone!"

