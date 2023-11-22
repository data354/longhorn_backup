AWS_ACCESS_KEY_ID=$(echo "azhzCg==" | base64 -d)
AWS_SECRET_ACCESS_KEY=$(echo "cGFzc3dvcmQK" | base64 -d)
AWS_ENDPOINTS=$(echo "aHR0cHM6Ly9zeXN0ZW0ubWluaW9hcGkuZW5lY2kubmV0Cg==" | base64 -d)

kubectl create secret generic minio-secret-test \
  --from-literal=AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
  --from-literal=AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
  --from-literal=AWS_ENDPOINTS="${AWS_ENDPOINTS}" \
  -n longhorn-system