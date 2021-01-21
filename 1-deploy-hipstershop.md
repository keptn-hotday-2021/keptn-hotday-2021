# Deploy Hipstershop

## Create project 

Make sure your are in the correct folder: `keptn-hotday-2021`.

the following command should use the token from Gitea but we can also use it as it is and add the Git upstream later.
```
keptn create project hipstershop --shipyard=/home/$(whoami)/keptn-hotday-2021/keptn-resources/shipyard.yaml
```

(Sample script:  `keptn-hotday-2021/scripts/createProject-hipstershop.sh`)

**Are we using gitea in this?**

TODO GIT UPSTREAM

e.g.
- create token in Gitea UI
- keptn update project with token


- troubleshooting: delete GIT token in user/settings/applications in Gitea online with `deleteApiToken` and then execute the `source ./gitea-functions.sh ; createKeptnRepoManually hipstershop` again.
- if not working, delete the `keptn-token.json`

## Onboard services


1. Let's add our first service:
```
keptn onboard service adservice --project=hipstershop --chart=/home/$(whoami)/keptn-hotday-2021/helm/adservice/
```

2. and deploy it
```
keptn send event new-artifact --project=hipstershop --service=adservice --image=gcr.io/dynatrace-demoability/adservice:jdk11
```

3. Let's add our second service
```
keptn onboard service redis-cart --project=hipstershop --chart=/home/$(whoami)/keptn-hotday-2021/helm/redis-cart/ --deployment-strategy=direct
```

4. ...and deploy it
```
keptn send event new-artifact --project=hipstershop --service=redis-cart --image=redis:alpine
```

5. The remaining services can be onboarded with the script from the github repo 
```
. /home/$(whoami)/keptn-hotday-2021/scripts/onboard-hipstershop.sh
```

6. Once the script has finished running verify that you can reach both URLs which were printed in the console. 


## Troublehooting 

If you are unable to reach the URLS or some pods are not running run the below command to identify the pods and notify your instructor. 
```
kubectl get pod --all-namespaces | grep -v "Running\|Terminating\|NAME"
```
Once the pods are succefully running try the two URLs again. You can re-generate the urls with the below two commands. (execute and open the URLs in a browser)
```
echo http://frontend.hipstershop-hardening.$(kubectl get ing -n default homepage-ingress -o=jsonpath='{.spec.tls[0].hosts[0]}')

echo http://frontend.hipstershop-production.$(kubectl get ing -n default homepage-ingress -o=jsonpath='{.spec.tls[0].hosts[0]}')
```

---
- [README](./README.md)
- [1- Explore Keptn](./0-explore-keptn.md)
- [2- Deploy Hipstershop](./1-deploy-hipstershop.md)
- [3- Configure Monitoring](./2-configure-monitoring.md)
- [4- Configure Quality Gates](./3-quality-gates.md)
- [5- Configure Redmediation](./4-remediation.md)