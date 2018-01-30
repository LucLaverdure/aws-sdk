for D in `ls -d */ | grep $1`
do
	DIR=$(echo ${D%/} | sed -e "s/^\.\///g")
	echo "importing $DIR..."
	aws s3api create-bucket --bucket $DIR
	aws s3 sync "$DIR" "s3://$DIR"
done
