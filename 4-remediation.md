
# STILL NEED AN EXPLINATION OF WHAT WE'RE DOING HERE

## Deploy Unleash?

unleash is already deployed via Keptn-in-a-box. check if we have time to do it manually or if the automation is fine.

## Configure Unleash

Either via API calls or via the UI

Option 1: API

```
export UNLEASH_TOKEN=$(echo -n keptn:keptn | base64)
export UNLEASH_BASE_URL=http://unleash.unleash-dev.$(kubectl get ing -n default homepage-ingress -o=jsonpath='{.spec.tls[0].hosts[0]}')
```

```
curl --request POST \
  --url ${UNLEASH_BASE_URL}/api/admin/features/ \
  --header "authorization: Basic ${UNLEASH_TOKEN}" \
  --header 'content-type: application/json' \
  --data '{
  "name": "EnablePromotion",
  "description": "adservice",
  "enabled": false,
    "strategies": [
    {
      "name": "default",
      "parameters": {}
    }
  ]
}'
```

Option 2: do we want to do it via the UI? or we can just take a look what was created:

```
http://unleash.unleash-dev.$(kubectl get ing -n default homepage-ingress -o=jsonpath='{.spec.tls[0].hosts[0]}')
```
Credentials: keptn/keptn

We can see one feature flag created
![unleash](./assets/unleash-ff.png)

## Configure Keptn for Unleash

Let's add the credentials for Unleash to be able to communicate from Ketpn to Unleash.

```
kubectl apply -f https://raw.githubusercontent.com/keptn-contrib/unleash-service/release-0.2.0/deploy/service.yaml -n keptn
```

1. Configure unleash remediation instructions

```
keptn add-resource --project=hipstershop --service=adservice --stage=production --resource=/home/$(whoami)/keptn-hotday-2021/service/adservice/remediation.yaml --resourceUri=remediation.yaml
```
2. 
```
keptn add-resource --project=hipstershop --service=adservice --stage=production --resource=/home/$(whoami)/keptn-hotday-2021/service/adservice/slo.yaml --resourceUri=slo.yaml
```

3. Configure Dynatrace
- Navigate to the hipstershop adservice in your Dynatrace tenat

![anomaly detection](./assets/dt-anomaly-detection.png)



4. Do experiment

Deploy version that has the flag included.

```
keptn send event new-artifact --project=hipstershop --service=adservice --image=gcr.io/dynatrace-demoability/adservice --tag=v1.5
```
---
- [README](./README.md)
- [1- Explore Keptn](./0-explore-keptn.md)
- [2- Deploy Hipstershop](./1-deploy-hipstershop.md)
- [3- Configure Monitoring](./2-configure-monitoring.md)
- [4- Configure Quality Gates](./3-quality-gates.md)
- [5- Configure Redmediation](./4-remediation.md)