# keptn-hotday-2021

!Work-in-progress!

## some welcome words...

... go here

## Infrastructure in AWS

ubuntu 20.4 LTS 
size m5.4xlarge
disk 30GB

## connect to your instance

SSH into the machine

## Install Keptn
done via Keptn-in-a-box

curl -O https://raw.githubusercontent.com/keptn-sandbox/keptn-in-a-box/release-0.7.3/keptn-in-a-box.sh
chmod +x keptn-in-a-box.sh

sudo bash -c './keptn-in-a-box.sh &'
less +F /tmp/install.log

Installation will take about 6-10 minutes

## What has been installed?
- Keptn
- Unleash
- Sockshop (carts microservice) with multi-stage pipeline

#

Follow up with 1-deploy-hipstershop.md