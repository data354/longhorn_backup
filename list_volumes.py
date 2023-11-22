from client_longhorn import client

for volume in client.list_volume().data:
  print("({}) ns: {} pv: {} pvc: {} status: {}".format(
    volume.created,
    volume.kubernetesStatus.namespace,
    volume.kubernetesStatus.pvName,
    volume.kubernetesStatus.pvcName,
    volume.kubernetesStatus.pvStatus,
  ))