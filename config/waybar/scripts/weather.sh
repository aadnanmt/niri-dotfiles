#!/bin/bash
CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/weather"

DATA=$(curl -sf "wttr.in/?format=j1" 2> /dev/null)

if [[ -z "$DATA" ]]; then
    if [[ -f "$CACHE" ]]; then
        DATA=$(cat "$CACHE")
  else
        echo '{"text":"󰅧 N/A","tooltip":"No network","alt":"Error","class":"error"}'
        exit
  fi
else
    echo "$DATA" > "$CACHE"
fi

TEMP=$(echo "$DATA" | python3 -c "import sys,json; print(json.load(sys.stdin)['current_condition'][0]['temp_C'])" 2> /dev/null)
CODE=$(echo "$DATA" | python3 -c "import sys,json; print(json.load(sys.stdin)['current_condition'][0]['weatherCode'])" 2> /dev/null)

case "$CODE" in
    113) I="󰖙" ;; 116) I="󰖕" ;; 119 | 122) I="󰖐" ;; 143 | 248 | 260) I="󰖑" ;;
    176 | 263 | 266 | 293 | 296 | 299 | 302 | 305 | 308) I="󰖗" ;;
    200 | 386 | 389 | 392 | 395) I="󰖓" ;;
    227 | 230 | 179 | 182 | 185 | 281 | 284 | 311 | 314 | 317 | 320 | 323 | 326 | 329 | 332 | 335 | 338 | 350 | 362 | 365 | 371 | 374 | 377) I="󰖘" ;;
    353 | 356 | 359) I="󰖖" ;;
    *) I="󰖐" ;;
esac

echo "{\"text\":\"$I $TEMP°C\",\"alt\":\"$TEMP°C\",\"class\":\"normal\"}"
