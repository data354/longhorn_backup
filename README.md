## Longhorn backup client

This project use the python longhorn client to perform longhorn operations (snaphots, backups, recurring jobs) using scripts.

## Expose your longhorn frontend
The longhorn client use the longhorn frontend url for sending request to longhorn API, so if you work outside the cluster to must expose your frontend by using nodePort service. Else if you run a job inside the cluster you can use the frontend service name in the longhorn-system namespace.

To expose the longhorn frontend, we use a nodePort service contained in the `longhorn-svc-port.yaml` file. You cant execute it using the following command: 
```bash
kubectl apply -f longhorn-svc-port.yaml
```

## Configure the client
Once the longhorn frontend is exposed (), you have to configure the longhorn client using the url in the `longhorn_url` variable in the `client_longhorn.py` file. 

We've used `localhost` because the machine from which we'll run the script is one of the nodes in the kubernetes cluster. If this is not the case (e.g. if you are using a bastion that is not in the cluster), please specify the ip of the machine you wish to use.

## Secrets management
Secrets allow us to access remote backup stores to make backups from our kubernetes cluster. They must be created in the longhorn-system namespace in order to be found by longhorn. In the secrets folder we create three secrets to suit our different environments: 

- aws-secret.sh : a remote backup store hosted on an aws S3 service
- minio-secret-oci.sh : a backup store hosted on an OCI minio server
- minio-secret-test.sh : a backup store hosted on a minio server outside OCI, used for testing new backups.

To create the secrets, run the files mentioned above using the sh command. If they already exist the command will return an error.

## Setting backup target and secrets up
Once the secrets have been created in the longhorn-system namespace, you can use them to configure a remote backup store. In the `set_backupstore_credentials.py` file, change the contents of the backupSecret variable to the name of the secret you want to use, depending on the backupstore you prefer for backups.

We have three backup stores whose secrets are as follows:

- aws-secret: a remote backup store hosted on an aws S3 service
- minio-secret-oci: a backup store hosted on an OCI minio server
- minio-secret-test: a backup store hosted on a minio server outside OCI, used for testing new backups.

By convention, we have decided to use the same buckets and folders in all the backup stores, in order to make it easier to change from one environment to another. This information is contained in the variables backupFolder and backupTarget in the `set_backupstore_credentials.py` file.

## Create a snapshot/backup
the snapshot.py file is responsible for creating snapshots and backups of your volumes. Before launching a snapshot, you need to modify the following two variables as you see fit :

- volumeId : represents the volume identifier, which you can get from the longhorn user interface
- createBackup : which indicates whether you want to make a backup of the snapshot on a backupstore (True) distance or not (False). It is set to True by default.

Once you have finished modifying the file, you can launch it using the following command:
```bash
python3 snapshot.py
``` 