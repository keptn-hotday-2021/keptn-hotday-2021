## Configure monitoring
>> most if not all of  this is setup with keptn in a box.  Will need to revist after clean  install

# nope
Prepare Dynatrace environment variables
```
export DT_TENANT= ## NO HTTPS and NO SLASHES! ex UUID.live.dynatrace.com
export DT_API_TOKEN=
export DT_PAAS_TOKEN=
```
# nope
create secret

```
kubectl -n keptn create secret generic dynatrace --from-literal="DT_TENANT=$DT_TENANT" --from-literal="DT_API_TOKEN=$DT_API_TOKEN" --from-literal="KEPTN_API_URL=http://keptn.$(kubectl get ing -n default homepage-ingress -o=jsonpath='{.spec.tls[0].hosts[0]}')/api" --from-literal="KEPTN_API_TOKEN=$(kubectl get secret keptn-api-token -n keptn -ojsonpath={.data.keptn-api-token} | base64 --decode)" --from-literal="KEPTN_BRIDGE_URL=http://keptn.$(kubectl get ing -n default homepage-ingress -o=jsonpath='{.spec.tls[0].hosts[0]}')/bridge"
```

## Install OneAgent

```
curl -o deploy-dynatrace-oneagent.sh https://raw.githubusercontent.com/keptn/examples/release-0.7.0/dynatrace-oneagent/deploy-dynatrace-oneagent.sh
chmod +x deploy-dynatrace-oneagent.sh
./deploy-dynatrace-oneagent.sh
```

Let's check if everything has been installed correctly.
```
kubectl get pods -n dynatrace
```

## Configure Dynatrace for our project

Install the Dynatrace integration for Keptn.
```
kubectl apply -f https://raw.githubusercontent.com/keptn-contrib/dynatrace-service/0.10.1/deploy/service.yaml -n keptn
```

Verify that we have our integration up and running.
```
kubectl get pods -n keptn 

dynatrace-service-f4c479bc7-ggr8k

```

TODO add what's happening in here

```
keptn configure monitoring dynatrace --project=hipstershop
```

Add the Dynatrace SLI service that will fetch the data later on for our quality gates.

```
kubectl apply -f https://raw.githubusercontent.com/keptn-contrib/dynatrace-sli-service/release-0.7.1/deploy/service.yaml -n keptn
```


```
keptn add-resource --project=hipstershop --resource=keptn-resources/sli-config-dynatrace.yaml --resourceUri=dynatrace/sli.yaml
```