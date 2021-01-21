
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

TODO check if already exists if installation is done via Keptn-in-a-box
```
kubectl -n keptn create secret generic unleash --from-literal="UNLEASH_SERVER_URL=http://unleash.unleash-dev/api" --from-literal="UNLEASH_USER=keptn" --from-literal="UNLEASH_TOKEN=keptn"
```

```
kubectl apply -f https://raw.githubusercontent.com/keptn-contrib/unleash-service/release-0.2.0/deploy/service.yaml -n keptn
```

## Add remediation instructions

```
keptn add-resource --project=hipstershop --service=adservice --stage=production --resource=service/adservice/remediation.yaml --resourceUri=remediation.yaml
```

```
keptn add-resource --project=hipstershop --service=adservice --stage=production --resource=service/adservice/slo.yaml --resourceUri=slo.yaml
```

## Configure Dynatrace

![anomaly detection](./assets/dt-anomaly-detection.png)

## Do experiment

Deploy version that has the flag included.

also the JDK11 version should have the feature flag incluced -- TO BE TESTED!
```
keptn send event new-artifact --project=hipstershop --service=adservice --image=gcr.io/dynatrace-demoability/adservice --tag=v1.5
```


## Let's run the experiment

Let's now change our configuration without redeploying the application. We will do this via the Feature Toggle that we just created. 
Please note that our application is already prepared to implement the effect of the feature flag and with Unleash we have a nice way to toggle the feature flag from outside of the application.

In your Unleash environment, let's do the following: **Turn on** the feature flag "EnablePromotion" that we created earlier.
![unleash enable](./assets/unleash-enable.png)

### What will happen next?

This will enable a special promotion in our `AdService` of the Hipstershop. However, it our demo it is expected, that this will introduce some troubles. But don't worry, Keptn got us covered!

After a couple of minutes Dynatrace will detect a decrease in the response time of the `AdService` and will open a problem ticket. Due to the Keptn integration with Dynatrace, an alert is sent from Dynatrace to Keptn.
Keptn will pick up this problem event (alert) and start executing the remediation workflow. 

The workflow was already defined by us in the `remediation.yaml` file that we added earlier. Again, a short recap what we have defined:

```yaml
apiVersion: spec.keptn.sh/0.1.4
kind: Remediation
metadata:
  name: adservice-remediation
spec:
  remediations:
    - problemType: Response time degradation
      actionsOnOpen:
        - action: toggle-feature
          name: Toogle feature flag
          description: Toogle feature flag EnablePromotion to OFF
          value: 
            EnablePromotion: "off"
    - problemType: Failure rate increase
      actionsOnOpen:
        - action: toggle-feature
          name: Toogle feature flag
          description: Toogle feature flag EnablePromotion to OFF
          value: 
            EnablePromotion: "off"
```

In this example, we have two remediations defined, but in today's workshop we only use the one for the `problemType` "Response time degradation". There is an `action` defined if the problem opens, which is a `toggle-feature` action. It has name, description, and what is important for the automation part: a value property with key/value pairs. In our case the key is the name of the feature flag, i.e., `EnablePromotion` and the value is the state we want the feature toggle to set. 

The [Unleash feature toggle integration](https://github.com/keptn-contrib/unleash-service/) is picking up these values and executing the remediation as defined in the declarative `remediation.yaml` file. 

We will see all the steps that are executed in the Keptn's Bridge:
![bridge remediation](./assets/bridge-remediation.png)

