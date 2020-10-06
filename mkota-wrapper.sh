#!/bin/bash
ls $1 || git commit -m "$3: Automatic OTA Update FAILED"
ls $1 || exit 1 
IFS=']' read -r -a json < ota/$3.json
chmod +x mkota.sh
NEWDATA=`./mkota.sh $1 $2 $4`
echo "${json[0]},${NEWDATA}]${json[1]}" > ota/$3.json
git add ota/$3.json
git commit -m "$3: Automatic OTA Update"
