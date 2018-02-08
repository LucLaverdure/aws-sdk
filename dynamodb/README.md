# README #

This README would normally document whatever steps are necessary to get your application up and running.

### What is this repository for? ###

Migration of AWS Account to another AWS Account

### How do I get set up? ###

./install.sh

### S3 Buckets ###

set AWS dev environment by running "aws configure"
Then run export.sh
export.sh supports filter as first argument, ex: export.sh Zone will only copy pathnames with zone

set AWS prod environment by running "aws configure"
Then run import.sh

### dynamodb ###

set AWS dev environment by running "aws configure"
Then run export.sh
export.sh supports filter as first argument, ex: export.sh Zone will only copy pathnames with zone

set AWS prod environment by running "aws configure"
Then run import.sh

### Who do I talk to? ###

llaverdure@realdecoy.com