FILE=$1
DEVICE=$2

if [ -z $FILE ]; then
    echo "No file specified"
    exit
elif [ ! -e $FILE ]; then
    echo "File not found"
    exit
elif [ -z $DEVICE ]; then
    echo "Please specify a device"
    exit
elif [ ! -e $DEVICE ]; then
    echo "Device not found or connected"
    echo "Maybe check your cable"
    exit
fi

echo "Succes"
#avrdude -p atmega328p -D -Uflash:w:"$FILE" -v -v -F -c avrisp -P $DEVICE