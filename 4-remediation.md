
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

## Configure Keptn for Unleash

Let's add the credentials for Unleash to be able to communicate from Ketpn to Unleash.

TODO check if already exists if installation is done via Keptn-in-a-box
```
kubectl -n keptn create secret generic unleash --from-literal="UNLEASH_SERVER_URL=http://unleash.unleash-dev/api" --from-literal="UNLEASH_USER=keptn" --from-literal="UNLEASH_TOKEN=keptn"
```

```
kubectl apply -f https://raw.githubusercontent.com/keptn-contrib/unleash-service/release-0.2.0/deploy/service.yaml -n keptn
```

## Add remediation instructions

```
cd ???

keptn add-resource --project=hipstershop --service=adservice --stage=production --resource=service/adservice/remediation.yaml --resourceUri=remediation.yaml
```

```
keptn add-resource --project=hipstershop --service=adservice --stage=production --resource=service/adservice/slo.yaml --resourceUri=slo.yaml
```

## Configure Dynatrace

![anomaly detection](./assets/dt-anomaly-detection.png)

## Do experiment

Deploy version that has the flag included.

```
keptn send event new-artifact --project=hipstershop --service=adservice --image=gcr.io/dynatrace-demoability/adservice --tag=v1.5
```
