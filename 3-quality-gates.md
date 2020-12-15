
# Keptn Quality Gates
## Add Tests

Let us add some tests that will be triggered by Keptn for each new deployment.

```
keptn add-resource --project=hipstershop --stage=hardening --service=frontend --resource=service/frontend/jmeter/load.jmx --resourceUri=jmeter/load.jmx

keptn add-resource --project=hipstershop --stage=hardening --service=frontend --resource=service/frontend/jmeter/jmeter.conf.yaml --resourceUri=jmeter/jmeter.conf.yaml
```
## Add Quality Gate

```
keptn add-resource --project=hipstershop --stage=hardening --service=frontend --resource=service/frontend/slo.yaml --resourceUri=slo.yaml
```

## Deploy new version

- (Initial version)
  ```
  keptn send event new-artifact --project=hipstershop --service=frontend --image=gcr.io/dynatrace-demoability/frontend --tag=v1.0
  ```

- Slow version, won't pass hardening stage
  ```
  keptn send event new-artifact --project=hipstershop --service=frontend --image=gcr.io/dynatrace-demoability/frontend --tag=v1.5
  ```



## Validate new deployment

Open the bridge and let's check

## Deploy next version

- Fast version again, will pass the hardening stage
```
keptn send event new-artifact --project=hipstershop --service=frontend --image=gcr.io/dynatrace-demoability/frontend --tag=v2.1
```

# ATTENTION

services might not show up correctly in Dyntrace

if not, a restart of all pods in the namespaces `hipstershop-hardening` and `hipstershop-production` should to the trick. 
we have to verify and if we need this workaround, we need to explain why.