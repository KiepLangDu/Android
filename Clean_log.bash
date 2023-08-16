#### Clean Replays
cd /sdcard/Android/data/com.riotgames.league.wildriftvn/files/Replays/4000300699301/882728827094849141/
rm $(ls -t | grep -v $(ls -t |head -n 1)) 
### Clean Log
cd /sdcard/Android/data/com.riotgames.league.wildriftvn/files/Log/
rm $(ls -t *.log | grep -v $(ls -t *.log | head -n 1)) 
