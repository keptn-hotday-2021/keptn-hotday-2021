
## onboard all services

# keptn create project hipstershop --shipyard=/home/$(whoami)/keptn-hotday-2021/keptn-resources/shipyard.yaml
# sleep 3

# sleep 1
# keptn onboard service adservice --project=hipstershop --chart=/home/$(whoami)/keptn-hotday-2021/helm/adservice/
# sleep 3

# sleep 1 
# keptn send event new-artifact --project=hipstershop --service=adservice --image=docker.io/jetzlstorfer/adservice:promotioncampaign-slow
# sleep 3

# sleep 1
# keptn onboard service redis-cart --project=hipstershop --chart=/home/$(whoami)/keptn-hotday-2021/helm/redis-cart/ --deployment-strategy=direct
# sleep 3
# keptn send event new-artifact --project=hipstershop --service=redis-cart --image=redis:alpine

sleep 1
keptn onboard service cartservice --project=hipstershop --chart=/home/$(whoami)/keptn-hotday-2021/helm/cartservice
sleep 3
keptn send event new-artifact --project=hipstershop --service=cartservice --image=gcr.io/dynatrace-demoability/cartservice:original

sleep 1
keptn onboard service checkoutservice --project=hipstershop --chart=/home/$(whoami)/keptn-hotday-2021/helm/checkoutservice
sleep 3
keptn send event new-artifact --project=hipstershop --service=checkoutservice --image=gcr.io/dynatrace-demoability/checkoutservice:9e830c2

sleep 1
keptn onboard service currencyservice --project=hipstershop --chart=/home/$(whoami)/keptn-hotday-2021/helm/currencyservice
sleep 3
keptn send event new-artifact --project=hipstershop --service=currencyservice --image=gcr.io/dynatrace-demoability/currencyservice:9e830c2

sleep 1
keptn onboard service emailservice --project=hipstershop --chart=/home/$(whoami)/keptn-hotday-2021/helm/emailservice
sleep 3
keptn send event new-artifact --project=hipstershop --service=emailservice --image=gcr.io/dynatrace-demoability/emailservice:9e830c2

sleep 1
keptn onboard service frontend --project=hipstershop --chart=/home/$(whoami)/keptn-hotday-2021/helm/frontend
sleep 3
keptn send event new-artifact --project=hipstershop --service=frontend --image=gcr.io/dynatrace-demoability/frontend:v2.1

sleep 1
keptn onboard service paymentservice --project=hipstershop --chart=/home/$(whoami)/keptn-hotday-2021/helm/paymentservice
sleep 3
keptn send event new-artifact --project=hipstershop --service=paymentservice --image=gcr.io/dynatrace-demoability/paymentservice:9e830c2

sleep 1
keptn onboard service productcatalogservice --project=hipstershop --chart=/home/$(whoami)/keptn-hotday-2021/helm/productcatalogservice
sleep 3
keptn send event new-artifact --project=hipstershop --service=productcatalogservice --image=gcr.io/dynatrace-demoability/productcatalogservice:9e830c2

sleep 1
keptn onboard service recommendationservice --project=hipstershop --chart=/home/$(whoami)/keptn-hotday-2021/helm/recommendationservice
sleep 3
keptn send event new-artifact --project=hipstershop --service=recommendationservice --image=gcr.io/dynatrace-demoability/recommendationservice:9e830c2

sleep 1
keptn onboard service shippingservice --project=hipstershop --chart=/home/$(whoami)/keptn-hotday-2021/helm/shippingservice
sleep 3
keptn send event new-artifact --project=hipstershop --service=shippingservice --image=gcr.io/dynatrace-demoability/shippingservice:9e830c2

sleep 1
keptn onboard service loadgenerator --project=hipstershop --chart=/home/$(whoami)/keptn-hotday-2021/helm/loadgenerator --deployment-strategy=direct
sleep 3
keptn send event new-artifact --project=hipstershop --service=loadgenerator --image=gcr.io/dynatrace-demoability/loadgenerator:9e830c2
sleep 10

echo -e "\n***********\nThis script has finished";echo -e "\nVerify the below two urls are reachable in your browser:\n\nhttp://frontend.hipstershop-hardening.$(kubectl get ing -n default homepage-ingress -o=jsonpath='{.spec.tls[0].hosts[0]}')\n\nhttp://frontend.hipstershop-production.$(kubectl get ing -n default homepage-ingress -o=jsonpath='{.spec.tls[0].hosts[0]}')\n\nIf they are not please notify your instuctor\n";sleep 1;echo -e  $(kubectl  get pod --all-namespaces  | grep -v "Running\|Terminating\|NAME" | wc -l)"\n^ if this output is not 0 please notify your instructor"