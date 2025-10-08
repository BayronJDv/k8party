# intrucciones pods

1. aplicar los manifiestos

```bash
kubectl apply -f reggaetonpod.yaml
kubectl apply -f salseropod.yaml
```

2. verificar los pods 

```bash
kubectl get pods -l app=santiago1 -o wide -n salsa
kubectl get pods -l app=santiago2 -o wide -n salsa
```