# Lista de servicios y sus puertos
$services = @{
    "ms-farmacia"       = 8006;
    "ms-inventario-svc" = 8002;
    "ms-trabajador"     = 8003;
    "ms-usuariocliente" = 8004;
    "ms-venta"          = 8005;
}

# Namespace donde están desplegados los microservicios principales
$namespace = "backend"

# Iterar y hacer port-forward para cada servicio
foreach ($service in $services.GetEnumerator()) {
    $svcName = $service.Key
    $port = $service.Value

    Write-Host "Iniciando port-forward para $svcName en puerto $port..." -ForegroundColor Green

    Start-Process -NoNewWindow powershell -ArgumentList "kubectl port-forward svc/$svcName `${port}:`${port} -n $namespace"
    
    Start-Sleep -Seconds 3
}

# Port-forward para servicios de monitoring
Write-Host "Iniciando port-forward para grafana-service en puerto 3000..." -ForegroundColor Cyan
Start-Process -NoNewWindow powershell -ArgumentList "kubectl port-forward svc/grafana-service 3000:3000 -n monitoring"
Start-Sleep -Seconds 3

Write-Host "Iniciando port-forward para prometheus-service en puerto 9090..." -ForegroundColor Cyan
Start-Process -NoNewWindow powershell -ArgumentList "kubectl port-forward svc/prometheus-service 9090:9090 -n monitoring"
Start-Sleep -Seconds 3


# comandos de ejecucion en powershell
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
# .\port-forward-all.ps1
# Todo en la altura de donde se encuentra este archivo