#!/bin/sh

#
# Set the scan fields of some SCPI records
#
case "$#" in
    0)  S="1 second" ; P="Prologix:" ; R="Test:" ;;
    1)  S="$1"       ; P="Prologix:" ; R="Test:" ;;
    2)  S="$1"       ; P="$2:"       ; R="Test:" ;;
    3)  S="$1"       ; P="$3:"       ; R="$3"    ;;
    *)  echo "Usage: $0 SCAN [P [R]]" >&2 ; exit 1 ;;
esac

case "$S" in
    0)         S="Passive"   ;;
    1|2|5|10)  S="$S second" ;;
esac

for pv in IDN GetESE GetESR GetOPC GetSRE GetSTB
do
    caput "$P$R$pv.SCAN" "$S"
done
