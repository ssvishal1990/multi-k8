docker build -t ssvishal1990/multi-client:latest -t ssvishal1990/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t ssvishal1990/multi-server:latest -t ssvishal1990/multi-server:$SHA  -f ./server/Dockerfile ./server
docker build -t ssvishal1990/multi-worker:latest -t ssvishal1990/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push ssvishal1990/multi-client:latest
docker push ssvishal1990/multi-server:latest
docker push ssvishal1990/multi-worker:latest


docker push ssvishal1990/multi-client:$SHA 
docker push ssvishal1990/multi-server:$SHA 
docker push ssvishal1990/multi-worker:$SHA 


kubectl apply -f k8s

kubectl set image deployments/client-deployment client=ssvishal1990/multi-client:$SHA
kubectl set image deployments/server-deployment server=ssvishal1990/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=ssvishal1990/multi-worker:$SHA