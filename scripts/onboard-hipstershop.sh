
## onboard all services


keptn onboard service redis-cart --project=hipstershop --chart=../helm/redis-cart/ --deployment-strategy=direct
keptn send event new-artifact --project=hipstershop --service=redis-cart --image=redis:alpine

keptn onboard service adservice --project=hipstershop --chart=../helm/adservice/
keptn send event new-artifact --project=hipstershop --service=adservice --image=gcr.io/dynatrace-demoability/adservice:jdk11

keptn onboard service cartservice --project=hipstershop --chart=../helm/cartservice
keptn send event new-artifact --project=hipstershop --service=cartservice --image=gcr.io/dynatrace-demoability/cartservice:original

keptn onboard service checkoutservice --project=hipstershop --chart=../helm/checkoutservice
keptn send event new-artifact --project=hipstershop --service=checkoutservice --image=gcr.io/dynatrace-demoability/checkoutservice:9e830c2

keptn onboard service currencyservice --project=hipstershop --chart=../helm/currencyservice
keptn send event new-artifact --project=hipstershop --service=currencyservice --image=gcr.io/dynatrace-demoability/currencyservice:9e830c2

keptn onboard service emailservice --project=hipstershop --chart=../helm/emailservice
keptn send event new-artifact --project=hipstershop --service=emailservice --image=gcr.io/dynatrace-demoability/emailservice:9e830c2

keptn onboard service frontend --project=hipstershop --chart=../helm/frontend
keptn send event new-artifact --project=hipstershop --service=frontend --image=gcr.io/dynatrace-demoability/frontend:v2.1

keptn onboard service paymentservice --project=hipstershop --chart=../helm/paymentservice
keptn send event new-artifact --project=hipstershop --service=paymentservice --image=gcr.io/dynatrace-demoability/paymentservice:9e830c2

keptn onboard service productcatalogservice --project=hipstershop --chart=../helm/productcatalogservice
keptn send event new-artifact --project=hipstershop --service=productcatalogservice --image=gcr.io/dynatrace-demoability/productcatalogservice:9e830c2

keptn onboard service recommendationservice --project=hipstershop --chart=../helm/recommendationservice
keptn send event new-artifact --project=hipstershop --service=recommendationservice --image=gcr.io/dynatrace-demoability/recommendationservice:9e830c2

keptn onboard service shippingservice --project=hipstershop --chart=../helm/shippingservice
keptn send event new-artifact --project=hipstershop --service=shippingservice --image=gcr.io/dynatrace-demoability/shippingservice:9e830c2

keptn onboard service loadgenerator --project=hipstershop --chart=../helm/loadgenerator --deployment-strategy=direct
keptn send event new-artifact --project=hipstershop --service=loadgenerator --image=gcr.io/dynatrace-demoability/loadgenerator:9e830c2

