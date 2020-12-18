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

* Considering reqorking the keptn-in-box script for a quicker deploy
* need to add a step to cycle all the pods after dyantrace installation
    ```
for i in keptn ingress default unleash-dev ; do kubectl delete pods --all -n $i; done
    ```

keptn ingress default unleash-dev

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

## Install Keptn-in-a-Box

**1. Download the github repo to your home directory**
```
curl -O https://raw.githubusercontent.com/keptn-sandbox/keptn-in-a-box/release-0.7.3/keptn-in-a-box.sh
```
2. Create a Dynatrace API Token
Log in to your Dynatrace tenant and go to Settings > Integration > Dynatrace API. Then, create anew API token with the following permissions

* Access problem and event feed, metrics, and topology
* Read log content
* Read configuration
* Write configuration
* Capture request data
* Real user monitoring JavaScript tag management
* Read metrics
* Ingest metrics
* Read entities

The below screen shot can be used for reference:
![](https://tutorials.keptn.sh/tutorials/keptn-in-a-box-07/img/5052ffbd6ab534f1.png)

3. Create a Dynatrace PaaS Token
In your Dynatrace tenant, go to Settings > Integration > Platform as a Service, and create a new PaaS Token.

4. Enter your Dynatrace Credentials
Now that you have an API-Token and a PaaS-Token, we can enter the credentials.
In the keptn-in-a-box.sh file enter your credentials under the section "Define Dynatrace Environment".


Edit the keptn in a box script to include your tenant ID, PASS & API tokens. These variable values can be found on line 39 of the file:
```
# ---- Define Dynatrace Environment ---- 
# Sample: https://{your-domain}/e/{your-environment-id} for managed or https://{your-environment-id}.live.dynatrace.com for SaaS
TENANT="https://mytenant.live.dynatrace.com"
PAASTOKEN="myDynatracePaaSToken"
APITOKEN="myDynatraceApiToken"
```

5. Install Keptn in a Box with sudo permissions
```
chmod +x keptn-in-a-box.sh; sudo bash -c './keptn-in-a-box.sh &'
```
6. Ignore the LESS command output and use the below command to watch the logs:

```
tail -f /tmp/install.log
```

Installation will take about 6-10 minutes

## What has been installed?
- Micro K8s
- Keptn
- Unleash
- Dynatrace OneAgent
- Docker
- Sockshop (carts microservice) with multi-stage pipeline
- Gitea - our UI for Git! (check the installation logs)
- A simple welcome website (check the installation logs)

7. Run the following command to restart some of the deployed pods

Dyntrace OneAngent auto-injects at run time when pods come up in Kubernetes. This will ensure any pods which may have been started before oneageny could be fully installed will be properly insturmented. 

    ```
for i in keptn ingress default unleash-dev ; do kubectl delete pods --all -n $i; done
    ```

# Clone needed resources into your home directory

TODO change to correct URL if needed

```
git clone -b harrington https://github.com/keptn-hotday-2021/keptn-hotday-2021
```

probably clone KIAB as well or check if cloned for current user


# Start the lab

For the lab, right now we have dedicated sub-documents

- 0-explore-keptn.md
- 1-deploy-hipstershop.md
- 2-configure-monitoring.md
- 3-quality-gates.md
- 4-remediation.md 

