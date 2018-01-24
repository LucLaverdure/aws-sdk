sudo chmod 777 -R .
sudo apt-get install python-pip
sudo pip install awscli
sudo pip install --upgrade pip
sudo apt-get install dos2unix
sudo apt-get install jq
sudo apt-get install python-boto3
sudo chmod 777 -R .
find . -type f -print0 | xargs -0 dos2unix
aws configure
