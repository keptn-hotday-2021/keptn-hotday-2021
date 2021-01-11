## Configure monitoring

## Configure Dynatrace for our project

1. Install the Dynatrace integration for Keptn.
```
kubectl apply -f https://raw.githubusercontent.com/keptn-contrib/dynatrace-service/0.10.1/deploy/service.yaml -n keptn
```

2. Verify that we have the dynatrace-service-xxx-xxx pod up and running in the keptn namespace
```
kubectl get pods -n keptn 
```

3. # TODO add what's happening in here
```
keptn configure monitoring dynatrace --project=hipstershop
```

4. Add the Dynatrace SLI service that will fetch the data later on for our quality gates.
```
kubectl apply -f https://raw.githubusercontent.com/keptn-contrib/dynatrace-sli-service/release-0.7.1/deploy/service.yaml -n keptn
```

5. Configue the SLI using the the sli.yaml file
```
keptn add-resource --project=hipstershop --resource=/home/$(whoami)/keptn-hotday-2021/keptn-resources/sli-config-dynatrace.yaml --resourceUri=dynatrace/sli.yaml
```
---
- [README](./README.md)
- [1- Explore Keptn](./0-explore-keptn.md)
- [2- Deploy Hipstershop](./1-deploy-hipstershop.md)
- [3- Configure Monitoring](./2-configure-monitoring.md)
- [4- Configure Quality Gates](./3-quality-gates.md)
- [5- Configure Redmediation](./4-remediation.md)