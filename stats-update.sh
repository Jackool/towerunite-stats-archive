steamAPIKey=`cat steam-api-key.ini`
(wget -S -d -v -O /dev/stdout "http://api.steampowered.com/ISteamUserStats/GetUserStatsForGame/v0002/?appid=394690&key=$steamAPIKey&steamid=76561198096770137" 2>76561198096770137/stats.log 1>76561198096770137/stats.json)
sed -i "s/$steamAPIKey/SNIPPED/g" 76561198096770137/stats.log

