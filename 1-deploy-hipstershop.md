# Deploy Hipstershop

## Create project 

Make sure your are in the correct folder: `keptn-hotday-2021`.

the following command should use the token from Gitea but we can also use it as it is and add the Git upstream later.
```
keptn create project hipstershop --shipyard=keptn-resources/shipyard.yaml
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


Let's add our first service:

```
keptn onboard service adservice --project=hipstershop --chart=/home/$(whoami)/keptn-hotday-2021/helm/adservice/
```

and deploy it

```
keptn send event new-artifact --project=hipstershop --service=adservice --image=gcr.io/dynatrace-demoability/adservice:jdk11
```

Let's add our second service

```
keptn onboard service redis-cart --project=hipstershop --chart=/home/$(whoami)/keptn-hotday-2021/helm/redis-cart/ --deployment-strategy=direct
```

... and deploy it

```
keptn send event new-artifact --project=hipstershop --service=redis-cart --image=redis:alpine
```


Do the rest with the script `./home/$(whoami)/keptn-hotday-2021/scripts/onboard-hipstershop.sh`


## Let's take a look

once finished, take a look:

```
echo http://frontend.hipstershop-hardening.$(kubectl get ing -n default homepage-ingress -o=jsonpath='{.spec.tls[0].hosts[0]}')

echo http://frontend.hipstershop-production.$(kubectl get ing -n default homepage-ingress -o=jsonpath='{.spec.tls[0].hosts[0]}')
```

(execute and open the URLs in a browser)