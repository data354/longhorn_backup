from client_longhorn import client

volumeId = "pvc-8a48db20-c774-4407-9302-56b2762cb3bf"
createBackup = True

volume = client.by_id_volume(id=volumeId)
snapshot = volume.snapshotCreate()

if createBackup:
  volume.snapshotBackup(name=snapshot.name)