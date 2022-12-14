#!/bin/bash


echo "Criando as images....."

docker build -t nanzin/projeto-backend:1.0 backend/.
docker build -t nanzin/projeto-database:1.0 database/.

echo "Realizando o push das images...."

docker push nanzin/projeto-backend:1.0
docker push nanzin/projeto-database:1.0

echo "Criando serviços no cluster kubernetes...."

kubectl apply -f ./services.yml

echo "Criando os deployments....."

kubectl apply -f ./deployment.yml