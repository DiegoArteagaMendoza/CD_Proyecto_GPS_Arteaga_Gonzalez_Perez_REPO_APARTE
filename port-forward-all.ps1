# Lista de servicios y sus puertos
$services = @{
    "ms-farmacia"           = 8006;
    "ms-inventario-svc"     = 8002;
    "ms-trabajador"         = 8003;
    "ms-usuariocliente"     = 8004;
    "ms-venta"              = 8005;
}

# Namespace donde están desplegados
$namespace = "backend"

# Iterar y hacer port-forward para cada servicio
foreach ($service in $services.GetEnumerator()) {
    $svcName = $service.Key
    $port = $service.Value

    Write-Host "Iniciando port-forward para $svcName en puerto $port..." -ForegroundColor Green

    # Usamos ${} para asegurar que PowerShell interprete bien la variable
    Start-Process -NoNewWindow powershell -ArgumentList "kubectl port-forward svc/$svcName `${port}:`${port} -n $namespace"
    
    # Esperar un poco para que se establezca la conexión
    Start-Sleep -Seconds 3

    # Opcional: abrir en el navegador
    # $url = "http://localhost:$port"
    # Write-Host "Abriendo $url en el navegador..." -ForegroundColor Cyan
    # Start-Process $url
}