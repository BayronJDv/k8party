# intrucciones pods

1. aplicar los manifiestos

```bash
kubectl apply -f rockeropod.yaml
kubectl apply -f reggaetonpod.yaml
```

2. verificar los pods 

```bash
kubectl get pods -l app=alejandro1 -o wide -n rock
kubectl get pods -l app=alejandro2 -o wide -n reggaeton
```