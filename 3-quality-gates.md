
# Keptn Quality Gates
# TO DO BREIF SUMMMARY OF THIS STEP
## Add Tests

1. Let us add some tests that will be triggered by Keptn for each new deployment.
# TO DO ^ TALK TRACK / SLIDE ON TESTS BEING ADDED
```
keptn add-resource --project=hipstershop --stage=hardening --service=frontend --resource=/home/$(whoami)/keptn-hotday-2021/service/frontend/jmeter/load.jmx --resourceUri=jmeter/load.jmx

keptn add-resource --project=hipstershop --stage=hardening --service=frontend --resource=/home/$(whoami)/keptn-hotday-2021/service/frontend/jmeter/jmeter.conf.yaml --resourceUri=jmeter/jmeter.conf.yaml
```
2. Configue Keptn for Quality Gates 
```
keptn add-resource --project=hipstershop --stage=hardening --service=frontend --resource=/home/$(whoami)/keptn-hotday-2021/service/frontend/slo.yaml --resourceUri=slo.yaml
```

3. Deploy new version
-  (Initial version)
  ```
  keptn send event new-artifact --project=hipstershop --service=frontend --image=gcr.io/dynatrace-demoability/frontend --tag=v1.0
  ```

- Slow version, won't pass hardening stage
  ```
  keptn send event new-artifact --project=hipstershop --service=frontend --image=gcr.io/dynatrace-demoability/frontend --tag=v1.5
  ```

4. Validate new deployment
- Open Keptn's Bridge. You can track the status of onboarded services in the UI:
```
echo http://$(kubectl get ing -n keptn api-keptn-ingress -o=jsonpath='{.spec.tls[0].hosts[0]}')
```

5. Deploy next version

- Fast version again, will pass the hardening stage
```
keptn send event new-artifact --project=hipstershop --service=frontend --image=gcr.io/dynatrace-demoability/frontend --tag=v2.1
```

---
- [README](./README.md)
- [1- Explore Keptn](./0-explore-keptn.md)
- [2- Deploy Hipstershop](./1-deploy-hipstershop.md)
- [3- Configure Monitoring](./2-configure-monitoring.md)
- [4- Configure Quality Gates](./3-quality-gates.md)
- [5- Configure Redmediation](./4-remediation.md)
