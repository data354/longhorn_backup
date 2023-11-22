kubectl create secret generic minio-secret \
  --from-literal=AWS_ACCESS_KEY_ID=k8s \
  --from-literal=AWS_SECRET_ACCESS_KEY=password \
  --from-literal=AWS_ENDPOINTS=https://system.minioapi.eneci.net \
  -n longhorn-system