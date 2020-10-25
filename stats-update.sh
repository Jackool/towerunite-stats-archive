#!/bin/bash

cd "${0%/*}"

steamIDs=("76561198096770137" "76561198056506073")

steamAPIKey=`cat steam-api-key.ini`

timeISO=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

for steamid64 in ${steamIDs[*]}; do
   mkdir -p "$steamid64"
   (wget -S -d -v -O /dev/stdout "https://api.steampowered.com/ISteamUserStats/GetUserStatsForGame/v0002/?appid=394690&key=$steamAPIKey&steamid=$steamid64" 2>"$steamid64/stats.log" 1>"$steamid64/stats.json")
   sed -i "s/$steamAPIKey/SNIPPED/g" "$steamid64/stats.log"
   jq '.' "$steamid64/stats.json" > "$steamid64/stats.formatted.json"
done

(git add -A && git commit -m "$timeISO" && git push -u origin main) || true
