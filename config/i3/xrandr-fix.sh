
DISCONNECT_SCREEN=$(xrandr | grep disconnected | awk '{print $1}')
CONNECTED_SCREEN=$(xrandr | grep " connected" | awk '{print $1}')

XRANDR_COMMAND="xrandr "

for SCREEN in $DISCONNECT_SCREEN; do
    XRANDR_COMMAND="$XRANDR_COMMAND --output $SCREEN --off";
done

$XRANDR_COMMAND

XRANDR_COMMAND="xrandr "

for SCREEN in $CONNECTED_SCREEN; do
    XRANDR_COMMAND="$XRANDR_COMMAND --output $SCREEN --mode 1920x1080 --pos 0x0";
done

$XRANDR_COMMAND