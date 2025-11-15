#! /bin/bash

cd `dirname $0`

RESO=23x37
#RESO=12x18

echo "var colors = {"
for i in blue green purple red yellow
do
  echo -n "\"$i\": \"data:image/png;base64,$(ffmpeg -v error -hide_banner -i markers/mark_$i.png -s $RESO -f apng - | base64 -w0)\""
  [ $i != "yellow"  ] && echo ","
done
echo "}"

