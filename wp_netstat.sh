TEMP=0
CURRENT=0
SPEED=0

BUFF_TEMP=0
BUFF_CURRENT=0
BUFF_SPEED=0


printf '%-20s\t%-20s\n' "received pps" "receive buffer error pps"
while :
do
	CURRENT=$(netstat -su | grep "packets received" | tr -cd "[0-9]")
	SPEED=$(( $CURRENT - $TEMP ))
		
	BUFF_CURRENT=$(netstat -su | grep "receive buffer errors" | tr -cd "[0-9]")
	BUFF_SPEED=$(( $BUFF_CURRENT - $BUFF_TEMP ))
	
	#echo "$SPEED			$ERR_SPEED		$BUFF_SPEED"	
	printf '%-20d\t%-20d\n' "$SPEED" "$BUFF_SPEED"
	sleep 1
	TEMP=$CURRENT
	BUFF_TEMP=$BUFF_CURRENT
	
done
