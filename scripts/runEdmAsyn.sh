#!/bin/sh

case "$#" in
    0)  P="Prologix:" ; R="Test:" ;;
    1)  P="$1:"       ; R="Test:" ;;
    2)  P="$1:"       ; R="$2"    ;;
    *)  echo "Usage: $0 [P [R]]" >&2 ; exit 1 ;;
esac

for d in . ..
do
    if [ -r "$d/Makefile" -a -r "$d/configure/RELEASE" ]
    then
        cd "$d"
        SVIFS="$IFS"
        IFS="=$IFS"
        set -- `make -p | grep '^ *ASYN *='`
        IFS="$SVIFS"
        ASYN="$2"
        break
    fi
done
export EDMDATAFILES="$ASYN/opi/edm"

edm -x -m "P=$P$R,R=asyn,PORT=L0,ADDR=-1" asynRecord.edl &
