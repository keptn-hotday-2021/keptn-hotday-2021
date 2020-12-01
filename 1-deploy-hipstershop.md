# Deploy Hipstershop

## Create project 

```
keptn create project hipstershop --shipyard=...
```

Sample script:  `keptn-hotday-2021/scripts/createProject-hipstershop.sh`

## Onboard services

For one or two services do it manually:

```
keptn onboard service ...
keptn send event new-artifact ...
```

Do the rest with the script `keptn-hotday-2021/scripts/onboard-hipstershop.sh`

