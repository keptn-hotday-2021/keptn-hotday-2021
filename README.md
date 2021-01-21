# Autonomous Cloud with Keptn: Delivery & Operations 

!Work-in-progress!

## Welcome to the Hands-on-Training day

In the next sections you will find the instructions to get familiar with the concept of the "Autonomous cloud" using Dynatrace and the open-source control-plane Keptn to implement it. 
We have prepared detailed instructions that should help you to successfully complete the hands-on-training. However, please reach out to the instructors immediately if you get stuck or run into any issues.

And most importantly: let's have fun walking through the lab!
## Infrastructure in AWS

We have prepared the infrastructure for you. This is what's running behind the scenes to provide you this lab:
- Ubuntu 20.4 LTS in AWS
- Instance size: m5.4xlarge
- Disk size: 30GB
- MicroK8s

## Connect to your instance

To get started, we will SSH into the machine that is provided for you. There is no need to install anything locally on your own machine. We will execute all of the commands from the provided instance.

Now please go ahead and follow your instructor to login to your machine.
## Install Keptn

While we are going to learn what Keptn is, we will trigger the installation in the background. Please note that this script is provided for workshop scenarios and will install more than just Keptn.
In fact, we are going to install MicroK8s, Dynatrace OneAgent, Keptn, and even have it initially configured so we can already access it. 

There is a script provided for you, please go ahead and download the installation script.

```
curl -O https://raw.githubusercontent.com/keptn-sandbox/keptn-in-a-box/release-0.7.3/keptn-in-a-box.sh
chmod +x keptn-in-a-box.sh
```

Now we are going to exeucte the installer which will take a couple of minutes to finish.
```
sudo bash -c './keptn-in-a-box.sh &'
```

While we wait for it to finish, we can watch the log output.
```
less +F /tmp/install.log
```

Installation will take about 6-10 minutes, please be patient.
In the meanwhile, your instructor will tell you more about Keptn and this hands-on-training.

## What has been installed?

- MicroK8s: a small Kubernetes distribution
- Keptn
- Unleash
- Sockshop (carts microservice) with multi-stage pipeline
- Gitea - our UI for Git! (check the installation logs)
- A simple welcome website (check the installation logs)

## Clone needed resources

You will need a couple of resources in this workshop. Let's go ahead and get them!

TODO change to correct URL if needed

```
git clone https://github.com/keptn-hotday-2021/keptn-hotday-2021
```

TODO verify if needed
probably clone KIAB as well or check if cloned for current user


# Start the lab

For the lab, right now we have dedicated sub-documents

- 0-explore-keptn.md
- 1-deploy-hipstershop.md
- 2-configure-monitoring.md
- 3-quality-gates.md
- 4-remediation.md 

