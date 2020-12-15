# Deploy Hipstershop

## Create project 

```
keptn create project hipstershop --shipyard=...
```

Sample script:  `keptn-hotday-2021/scripts/createProject-hipstershop.sh`


TODO GIT UPSTREAM

e.g.
- create token in Gitea UI
- keptn update project with token


- troubleshooting: delete GIT token in user/settings/applications in Gitea online with `deleteApiToken` and then execute the `source ./gitea-functions.sh ; createKeptnRepoManually hipstershop` again.
- if not working, delete the `keptn-token.json`

## Onboard services

For one or two services do it manually:

```
keptn onboard service ...
keptn send event new-artifact ...
```

Do the rest with the script `keptn-hotday-2021/scripts/onboard-hipstershop.sh`

