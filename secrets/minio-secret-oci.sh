kubectl create secret generic minio-secret-oci \
  --from-literal=AWS_ACCESS_KEY_ID=motower \
  --from-literal=AWS_SECRET_ACCESS_KEY=3Gkbd2QoRrhyvQyyVobQeBHJ6u3CHdgdO3MXrF1k \
  --from-literal=AWS_ENDPOINTS=http://10.242.33.176:9000 \
  -n longhorn-system