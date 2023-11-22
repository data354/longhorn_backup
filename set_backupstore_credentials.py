from client_longhorn import client

backupFolder = "BACKUP-DEV/"  #Dont forget the "/" at the end
backupTarget = "s3://motower@us-east-1/" +  backupFolder

backupSecret = "aws-secret"

backupTargetsetting = client.by_id_setting(id="backup-target")
backupTargetsetting = client.update(backupTargetsetting, value=backupTarget)

backupTargetCredentials = client.by_id_setting(id="backup-target-credential-secret")
backupTargetCredentials = client.update(backupTargetCredentials, value=backupSecret)
