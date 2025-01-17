kubectl run nginx --image=nginx --dry-run=client -o yaml > pod.yaml

k create deployment nginx-dep --image=nginx --replicas=3 --port=80 --dry-run=client -o yaml > deployment.yaml
