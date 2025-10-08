# intrucciones pods

1. aplicar los manifiestos

```bash
kubectl apply -f juandpod.yaml
kubectl apply -f juansalsa.yaml
```

2. verificar los pods 

```bash
kubectl get pods -l app=juand1 -o wide -n salsa
kubectl get pods -l app=juand2 -o wide -n salsa
```