# 1. Crear cluster base
k3d cluster create dev --agents 0

# 2. Agregar nodos con nombres descriptivos
k3d node create nodo-reggaeton --cluster dev --role agent
k3d node create nodo-rock --cluster dev --role agent
k3d node create nodo-techno --cluster dev --role agent
k3d node create nodo-salsa --cluster dev --role agent

