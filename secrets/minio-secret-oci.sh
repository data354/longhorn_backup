AWS_ACCESS_KEY_ID=$(echo "bW90b3dlcgo=" | base64 -d)
AWS_SECRET_ACCESS_KEY=$(echo "M0drYmQyUW9Scmh5dlF5eVZvYlFlQkhKNnUzQ0hkZ2RPM01YckYxawo=" | base64 -d)
AWS_ENDPOINTS=$(echo "aHR0cDovLzEwLjI0Mi4zMy4xNzY6OTAwMAo=" | base64 -d)

kubectl create secret generic minio-secret-oci \
  --from-literal=AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
  --from-literal=AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
  --from-literal=AWS_ENDPOINTS="${AWS_ENDPOINTS}" \
  -n longhorn-system