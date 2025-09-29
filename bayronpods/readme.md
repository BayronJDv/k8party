# intrucciones pods

1. aplicar los manifiestos

```bash
kubectl apply -f rockeropod.yaml
kubectl apply -f salseropod.yaml
```

2. verificar los pods 

```bash
kubectl get pods -l app=bayron1 -o wide -n rock
kubectl get pods -l app=bayron2 -o wide -n salsa
```