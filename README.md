# keptn-hotday-2021
![](https://dt-cdn.net/images/dynatrace-logo-rgb-cph-800x142px-ac1b21b785.svg)
!Work-in-progress!

*to do*
* remove gitea section?
* revisit where dynatrace gets installed
* add dynatrace and/or add steps for KiaB (is the repo needed?)
* modify onboaring script with comments

*problems (?)*
>Start upgrading chart hipstershop-hardening-loadgenerator in namespace hipstershop-hardening
>Warning: Websocket connection timed out

## some welcome words...

... go here

## Infrastructure in AWS

- ubuntu 20.4 LTS 
- size m5.4xlarge
- disk 30GB

## connect to your instance

SSH into the machine

## Install Keptn
done via Keptn-in-a-box

```
curl -O https://raw.githubusercontent.com/keptn-sandbox/keptn-in-a-box/release-0.7.3/keptn-in-a-box.sh
chmod +x keptn-in-a-box.sh
```

install
```
sudo bash -c './keptn-in-a-box.sh &'
```

then watch the logs...
```
tail -f /tmp/install.log
```

Installation will take about 6-10 minutes

## What has been installed?
- Keptn
- Unleash
- Sockshop (carts microservice) with multi-stage pipeline
- Gitea - our UI for Git! (check the installation logs)
- a simple welcome website (check the installation logs)

# Clone needed resources into your home directory

TODO change to correct URL if needed

```
git clone https://github.com/keptn-hotday-2021/keptn-hotday-2021
```

probably clone KIAB as well or check if cloned for current user


# Start the lab

For the lab, right now we have dedicated sub-documents

- 0-explore-keptn.md
- 1-deploy-hipstershop.md
- 2-configure-monitoring.md
- 3-quality-gates.md
- 4-remediation.md 

