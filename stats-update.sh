#!/bin/bash

cd "${0%/*}"

steamAPIKey=`cat steam-api-key.ini`

timeISO=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

(wget -S -d -v -O /dev/stdout "http://api.steampowered.com/ISteamUserStats/GetUserStatsForGame/v0002/?appid=394690&key=$steamAPIKey&steamid=76561198096770137" 2>76561198096770137/stats.log 1>76561198096770137/stats.json)

sed -i "s/$steamAPIKey/SNIPPED/g" 76561198096770137/stats.log

jq '.' 76561198096770137/stats.json > 76561198096770137/stats.formatted.json

(git add -A && git commit -m "$timeISO" && git push -u origin main) || true
