# 1. Crear cluster base
k3d cluster create dev --agents 0

# 2. Agregar nodos con nombres descriptivos
k3d node create nodo-reggaeton --cluster dev --role agent
k3d node create nodo-rock --cluster dev --role agent
k3d node create nodo-techno --cluster dev --role agent
k3d node create nodo-salsa --cluster dev --role agent

# 3. crear namespaces
kubectl create namespace reggaeton
kubectl create namespace rock
kubectl create namespace techno
kubectl create namespace salsa

# 4. aplicar taint a los nodos
kubectl taint nodes k3d-nodo-reggaeton-0 music=perreo-intenso:NoSchedule 
kubectl taint nodes k3d-nodo-rock-0 music=guitarra-electrica:NoSchedule 
kubectl taint nodes k3d-nodo-techno-0 music=bass-boost:NoSchedule 
kubectl taint nodes k3d-nodo-salsa-0 music=sabor-latino:NoSchedule

# 5 añadir labels para node affinity
kubectl label nodes k3d-nodo-reggaeton-0 style=urbano
kubectl label nodes k3d-nodo-rock-0 style=metalero
kubectl label nodes k3d-nodo-techno-0 style=electronico
kubectl label nodes k3d-nodo-salsa-0 style=latino