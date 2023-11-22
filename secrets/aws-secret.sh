AWS_ACCESS_KEY_ID=$(echo "QUtJQTJLSDJPSUdTUkxCQUhHVUcK" | base64 -d)
AWS_SECRET_ACCESS_KEY=$(echo "Mlg2MnExSGFnKzEzM3ljdzFlZlF4RjR1T212TUhhYWtsUXdnSkhxOQo=" | base64 -d)

kubectl create secret generic aws-secret \
  --from-literal=AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
  --from-literal=AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
  -n longhorn-system