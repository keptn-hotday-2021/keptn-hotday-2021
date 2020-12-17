# Autonomous Cloud with Keptn: Delivery & Operations
![](https://dt-cdn.net/images/dynatrace-logo-rgb-cph-800x142px-ac1b21b785.svg)


**!Work-in-progress!**

*to do: Harrington Edition*
* need updates from jurgen for gitea section
* revisit where dynatrace gets installed for clean build
* add dynatrace and/or add steps for KiaB (is the repo needed?)
* modify onboaring script with comments
    * unknown issue with helm chart conflict, must be off & re-onboarded to correct
* need a run down of what unleashed is supposed to be doing
* Add relevant KiaB steps to setup
    * https://tutorials.keptn.sh/tutorials/keptn-in-a-box-07/index.html?index=..%2F..index#0

* need to add a step to cycle all the pods after dyantrace installation
    ```
    for i in `kubectl get pod -n keptn | awk '{print $1}' | grep -v "NAME"`; do kubectl delete pod $i -n keptn; done
    ```

## Welcome to Dynatrace HoT Day 2021!

In today's hands on training we will be reviewing how to install and intergrate Keptn, an open source *something something company buzzwords here*

![](https://keptn.sh/images/logo.svg)

In this this lab we'll be shwoing you how to:
* Deploy Keptn into a Kubernetes cluster
* Deploy Dyantrace OneAgent into a Kubernetes cluster
* Build a multi-stage kubernetes & git ops based deployment pipeline
* Prevent bad code deployments from being deployed into production based on SLOs
* Create self healing actions leverging Dynatrace data

## The Infrastructure you'll be working with today:

- Ubuntu 20.04 LTS Image
- 16 core 64gb of RAM Virtual machine (m5.4xlarge AWS instance)
- 30gb Filesystem
- Ports 22, 80 & 443 open externally

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
- Dynatrace OneAgent
- Sockshop (carts microservice) with multi-stage pipeline
- Gitea - our UI for Git! (check the installation logs)
- A simple welcome website (check the installation logs)

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

