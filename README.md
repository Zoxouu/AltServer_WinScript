# 🌟 AltServerMonitor 🌟

## 📜 Description
**English**  
This PowerShell script monitors the presence of an iPhone device connected to your PC and automatically restarts the **AltServer** application if it detects the iPhone connection. This can be useful for users of AltServer who want to ensure the application is running whenever their iPhone is connected. 📱💻

**Français**  
Ce script PowerShell surveille la présence d'un iPhone connecté à votre PC et redémarre automatiquement l'application **AltServer** dès qu'il détecte la connexion de l'iPhone. Cela peut être utile pour les utilisateurs d'AltServer souhaitant s'assurer que l'application est toujours active lorsque leur iPhone est connecté. 📱💻

## ⚙️ Prerequisites / Prérequis
- Windows with PowerShell 🖥️
- **AltServer** must be installed. Follow the instructions [here](https://faq.altstore.io/altstore-classic/how-to-install-altstore-windows) to install AltServer (default path: `C:\Program Files (x86)\AltServer\AltServer.exe`). Update the path in the script if necessary. 🛠️

## 🚀 Usage / Utilisation

1. **Edit the script:**  
   Update `$altServerPath` in the script if AltServer is installed in a different location. ✏️

2. **Run the script:**  
   Execute the script in PowerShell by navigating to its directory and running:
   ```powershell
   .\AltServerMonitor.ps1
   ```
   ▶️

3. **Behavior:**  
   The script will:
   - Continuously check for the presence of the iPhone device in the file explorer. 🔍
   - Automatically restart AltServer if it detects an iPhone connection. 🔄
   - Log actions in the console, including when it restarts AltServer. 📝

## 🔍 Example / Exemple

```powershell
$processName = "AltServer"
$altServerPath = "C:\Program Files (x86)\AltServer\AltServer.exe"
```

## ⚠️ Notes
- **English:** You can modify the polling interval by adjusting the `Start-Sleep -Seconds 5` line. ⏳
- **Français:** Vous pouvez modifier l'intervalle de vérification en ajustant la ligne `Start-Sleep -Seconds 5`. ⏳

## 📄 License / Licence
MIT License 📝
