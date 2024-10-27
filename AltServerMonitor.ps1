$processName = "AltServer"
$altServerPath = "C:\Program Files (x86)\AltServer\AltServer.exe" # Mettez à jour ce chemin

# Fonction pour afficher les messages dans la console
function Write-Log {
    param (
        [string]$message
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "$timestamp - $message"
    Write-Host $logEntry
}

# Fonction pour redémarrer AltServer
function Restart-AltServer {
    try {
        if (Get-Process -Name $processName -ErrorAction SilentlyContinue) {
            Write-Log "Fermeture de AltServer."
            Stop-Process -Name $processName -Force -ErrorAction SilentlyContinue
            Start-Sleep -Seconds 2
        }
        Write-Log "Démarrage de AltServer."
        Start-Process $altServerPath
    } catch {
        Write-Error "Erreur lors du redémarrage d'AltServer : $_"
    }
}

# Boucle infinie pour garder le script actif
$iphonePath = "This PC\Apple iPhone"
$iphoneWasOpen = $false

while ($true) {
    Write-Log "Vérification de la présence de 'This PC\Apple iPhone'..."
    $shell = New-Object -ComObject Shell.Application
    $found = $false

    foreach ($folder in $shell.NameSpace(17).Items()) {
        if ($folder.Name -eq "Apple iPhone") {
            $found = $true
            break
        }
    }
    if ($found) {
        if (-not $iphoneWasOpen) {
            Write-Log "Le chemin 'This PC\Apple iPhone' est ouvert. Redémarrage d'AltServer."
            Restart-AltServer
            $iphoneWasOpen = $true
        }
    } else {
        if ($iphoneWasOpen) {
            Write-Log "Le chemin 'This PC\Apple iPhone' n'est plus ouvert."
        }
        $iphoneWasOpen = $false
    }
    Start-Sleep -Seconds 5
}
