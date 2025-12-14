
MUSIC_MONITOR_NAME="DP-3"
MUSIC_WORKSPACE=9
STATE_FILE="/tmp/hypr_music_prev_ws"

ORIGIN_MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name')

CURRENT_WS_ON_MUSIC_MONITOR=$(hyprctl monitors -j | jq -r ".[] | select(.name == \"$MUSIC_MONITOR_NAME\") | .activeWorkspace.id")

if [ "$CURRENT_WS_ON_MUSIC_MONITOR" -eq "$MUSIC_WORKSPACE" ]; then
    if [ -f "$STATE_FILE" ]; then
        PREV_WORKSPACE=$(cat "$STATE_FILE")
        hyprctl dispatch workspace $PREV_WORKSPACE
    else
        hyprctl dispatch workspace 1
    fi
    if [ "$ORIGIN_MONITOR" != "$MUSIC_MONITOR_NAME" ]; then
        hyprctl dispatch focusmonitor "$ORIGIN_MONITOR"
    fi

else

    echo "$CURRENT_WS_ON_MUSIC_MONITOR" > "$STATE_FILE"
    hyprctl dispatch workspace $MUSIC_WORKSPACE
    
fi
