from client_longhorn import client

backupTarget = "s3://motower@us-east-1/backup-dev/"
backupSecret = "minio-s"

backupTargetsetting = client.by_id_setting(id="backup-target")
backupTargetsetting = client.update(backupTargetsetting, value=backupTarget)

backupTargetCredentials = client.by_id_setting(id="backup-target-credential-secret")
backupTargetCredentials = client.update(backupTargetCredentials, value=backupSecret)
