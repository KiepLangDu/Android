#ALWAYS REMEMBER TO CHECK PATH OF DIRECTORIES ON YOUR STORAGE BEFORE RUN THIS CODE
adb shell "
###First part
#Clean replays
echo \"Clean replays and logs except for the last one \"
#cd /sdcard/Android/data/com.riotgames.league.wildriftvn/files/Replays/4000300699301/882728827094849141/
cd /sdcard/Android/data/com.riotgames.league.wildriftvn/files/Replays/*/*/
rm \$(ls -t | grep -v \$(ls -t |head -n 1)) 2> /sdcard/log.txt
if [[ \$? -eq  0 ]]
then
	echo \"Replays are cleaned\"
else
	echo \"Your replays are ready cleaned before\"
fi
## Next Part
#Clearn Log files
cd /sdcard/Android/data/com.riotgames.league.wildriftvn/files/Log/
rm \$(ls -t *.log 2> /sdcard/log.txt | grep -v \$(ls -t *.log 2> /sdcard/log.txt |head -n 1)) 2> /sdcard/log.txt
if [[ \$? -eq 0 ]]
then
	echo \"Logs are cleaned\"
else
	echo \"Your logs are ready cleaned before\"
fi
rm /sdcard/log.txt
"
