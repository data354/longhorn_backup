kubectl create secret generic aws-secret \
  --from-literal=AWS_ACCESS_KEY_ID=AKIA2KH2OIGSRLBAHGUG \
  --from-literal=AWS_SECRET_ACCESS_KEY=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 \
  -n longhorn-system