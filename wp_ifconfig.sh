RXP_TEMP=0
RXP_CURRENT=0
RXPPS=0

RXB_TEMP=0
RXB_CURRENT=0
RXBPS=0

if [ $# -lt 2 ]
then
	echo "ifname not specified."
	echo "Usage: $0 <ifname>"
	exit 1
fi


printf '%-20s\t%-20s\n' "received pps" "receivd bps"
while :
do
	RXP_CURRENT=$(ifconfig $1 | grep "RX packets" | awk '{print $3}')
	RXPPS=$(( $RXP_CURRENT - $RXP_TEMP ))
		
	RXB_CURRENT=$(ifconfig $1 | grep "RX packets" | awk '{print $5}')
	RXBPS=$(( $RXB_CURRENT - $RXB_TEMP ))
	
	#echo "$SPEED			$ERR_SPEED		$BUFF_SPEED"	
	printf '%-20d\t%-20d\n' "$RXPPS" "$RXBPS"
	sleep 1
	RXP_TEMP=$RXP_CURRENT
	RXB_TEMP=$RXB_CURRENT
	
done
