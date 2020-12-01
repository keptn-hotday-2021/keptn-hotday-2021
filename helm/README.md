# Helm Charts 

This folder contains all Helm charts I've used to onboard the Hipstershop to a Kubernetes cluster with [Keptn](https://keptn.sh).

## How to create a project a onboard the services

1. Make sure you have Keptn installed in your Kubernetes cluster and that the Keptn CLI is pointing to the correct cluster. If not, please visit https://keptn.sh or https://tutorials.keptn.sh?cat=installation to get started.

1. Create a project with a shipyard file. I've used the following shipyard file, but feel free to write your own.

    ```
    stages:
      - name: "hardening"
        test_strategy: "functional"
        deployment_strategy: "blue_green_service"
      - name: "prod"
        deployment_strategy: "blue_green_service"
    ```

    ```
    keptn create project hipstershop --shipyard=myshipyard.yaml
    ```

1. Now onboard each service:

    ```
    keptn onboard service adservice --project=hipstershop --chart=./adservice/
    ```

    **ATTENTION!**
    For the "redis-cart" service the procedure is a little bit different since this can not be deployed with a "blue/green" deployment strategy.

    ```
    keptn onboard service redis-cart --project=hipstershop --chart=./redis-cart/ --deployment-strategy=direct
    ```

1. Now go ahead and send a new artifact for each service (this can also be done after each `keptn onboard service`). You will find the image I've used in the `values.yaml` file in each subdirectory of the service.

    ```
    keptn send event new-artifact --project=hipstershop --service=adservice --image=gcr.io/dynatrace-demoability/awsadservice:45c069f
    ```

1. Once finished, you should be able to access the Hipstershop frontend on http://frontend.hipstershop-hardening.YOURCLUSTERIP.com (has to be changed to your actual projectname and stagename)

