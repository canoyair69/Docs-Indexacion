Aquí tienes un **formato minimalista y académico** en Markdown, con secciones para cada funcionalidad del script, y para cada una, los comandos recomendados para **Windows 11, Linux y macOS**. Los comandos están listos para copiar y pegar (en bloques de código Markdown).  
El objetivo es que puedas consultar rápidamente cómo realizar cada optimización en cualquier sistema operativo.

---

# 🛠️ System Optimization Scripts: Minimalist Cross-Platform Cheatsheet

## Índice

- [🛠️ System Optimization Scripts: Minimalist Cross-Platform Cheatsheet](#️-system-optimization-scripts-minimalist-cross-platform-cheatsheet)
  - [Índice](#índice)
  - [Optimización de Sistema](#optimización-de-sistema)
  - [Gestión de Memoria](#gestión-de-memoria)
  - [Optimización de SSD](#optimización-de-ssd)
  - [Optimización de Seguridad](#optimización-de-seguridad)
  - [Optimización de Red](#optimización-de-red)
    - [🛠️ System Optimization Scripts: Minimalist Cross-Platform Cheatsheet](#️-system-optimization-scripts-minimalist-cross-platform-cheatsheet-1)
    - [Índice](#índice-1)
    - [Optimización General del Sistema](#optimización-general-del-sistema)
      - [Windows 11 (PowerShell, como Admin)](#windows-11-powershell-como-admin)
    - [Gestión de Memoria](#gestión-de-memoria-1)
      - [Windows 11 (PowerShell)](#windows-11-powershell)
    - [Optimización de Almacenamiento (SSD/HDD)](#optimización-de-almacenamiento-ssdhdd)
      - [Windows 11 (PowerShell, como Admin)](#windows-11-powershell-como-admin-1)
    - [Optimización de Seguridad](#optimización-de-seguridad-1)
      - [Windows 11 (PowerShell, como Admin)](#windows-11-powershell-como-admin-2)
    - [Optimización de Red](#optimización-de-red-1)
      - [Windows 11 (PowerShell, como Admin)](#windows-11-powershell-como-admin-3)
    - [Limpieza de Cachés](#limpieza-de-cachés)
      - [Limpieza de Caché DNS](#limpieza-de-caché-dns)
      - [Configuración de Firewall](#configuración-de-firewall)
      - [Limpieza de Cachés y Archivos Temporales](#limpieza-de-cachés-y-archivos-temporales)
      - [Limpieza de Idiomas No Usados](#limpieza-de-idiomas-no-usados)
      - [Limpieza de Cachés de Fuentes](#limpieza-de-cachés-de-fuentes)
      - [Eliminar Archivos `.DS_Store` (equivalentes)](#eliminar-archivos-ds_store-equivalentes)
    - [Ajustes Visuales y de Interfaz (UI)](#ajustes-visuales-y-de-interfaz-ui)
      - [Windows 11](#windows-11)
    - [Scripts de Mantenimiento Programado](#scripts-de-mantenimiento-programado)
      - [Windows 11](#windows-11-1)
      - [Limpiar Registros (Logs) del Sistema](#limpiar-registros-logs-del-sistema)
    - [Gestión de Energía](#gestión-de-energía)
      - [Windows 11](#windows-11-2)
    - [Monitoreo del Sistema](#monitoreo-del-sistema)
  - [Flush DNS Cache](#flush-dns-cache)
  - [Firewall](#firewall)
  - [Limpieza de Cachés](#limpieza-de-cachés-1)
  - [Limpieza de Idiomas No Usados](#limpieza-de-idiomas-no-usados-1)
  - [Limpieza de Cachés de Fuentes](#limpieza-de-cachés-de-fuentes-1)
  - [Eliminar Archivos .DS\_Store](#eliminar-archivos-ds_store)
  - [Desactivar Spotlight](#desactivar-spotlight)
  - [Desactivar Dashboard](#desactivar-dashboard)
  - [Desactivar Animaciones](#desactivar-animaciones)
  - [Optimizar Dock](#optimizar-dock)
  - [Verificar Permisos de Disco](#verificar-permisos-de-disco)
  - [Scripts de Mantenimiento](#scripts-de-mantenimiento)
  - [Limpiar Logs del Sistema](#limpiar-logs-del-sistema)
  - [Resetear SMC](#resetear-smc)
  - [Modo Ahorro de Energía](#modo-ahorro-de-energía)
  - [AutoBoot (Solo Intel)](#autoboot-solo-intel)
  - [Estado MDM](#estado-mdm)
  - [Monitoreo del Sistema](#monitoreo-del-sistema-1)

---

## Optimización de Sistema

**macOS**

```bash
sudo sysctl -w kern.ipc.somaxconn=2048
sudo sysctl -w kern.ipc.nmbclusters=65536
sudo sysctl -w kern.maxvnodes=750000
sudo sysctl -w kern.maxproc=2048
sudo sysctl -w kern.maxfiles=200000
sudo sysctl -w kern.maxfilesperproc=100000
```

**Linux**

```bash
sudo sysctl -w net.core.somaxconn=2048
sudo sysctl -w vm.max_map_count=262144
sudo sysctl -w fs.file-max=200000
sudo sysctl -w kernel.pid_max=65536
```

**Windows 11 (PowerShell, como admin)**

```powershell
# Aumentar conexiones TCP
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpNumConnections" -Value 2048
# Aumentar handles de archivos
# No hay un comando directo, pero puedes ajustar el registro para procesos específicos.
```

---

## Gestión de Memoria

**macOS**

```bash
sudo purge
sudo pmset -a sms 0
sudo sync
sudo purge
```

**Linux**

```bash
sudo sync; sudo sysctl -w vm.drop_caches=3
```

**Windows 11 (PowerShell)**

```powershell
Clear-RecycleBin -Force
# Para liberar memoria, reinicia el proceso de explorer.exe o usa herramientas de terceros.
```

---

## Optimización de SSD

**macOS**

```bash
sudo trimforce enable
sudo pmset -a hibernatemode 0
sudo rm /var/vm/sleepimage
```

**Linux**

```bash
sudo fstrim -av
```

**Windows 11**

```powershell
Optimize-Volume -DriveLetter C -ReTrim -Verbose
```

---

## Optimización de Seguridad

**macOS**

```bash
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -int 1
sudo defaults write /Library/Preferences/com.apple.alf allowsignedenabled -int 1
```

**Linux**

```bash
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

**Windows 11**

```powershell
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
```

---

## Optimización de Red

**macOS**

```bash
sudo sysctl -w net.inet.tcp.delayed_ack=0
sudo sysctl -w net.inet.tcp.mssdflt=1440
sudo sysctl -w net.inet.tcp.blackhole=2
sudo sysctl -w net.inet.icmp.icmplim=50
sudo sysctl -w net.inet.tcp.path_mtu_discovery=1
sudo sysctl -w net.inet.tcp.tcp_keepalive=1
```

**Linux**

```bash
sudo sysctl -w net.ipv4.tcp_syncookies=1
sudo sysctl -w net.ipv4.tcp_fin_timeout=15
sudo sysctl -w net.ipv4.tcp_keepalive_time=600
```

**Windows 11**

¡Excelente adición! Este formato es fantástico para una referencia rápida multiplataforma. Vamos a retroalimentar este documento, agregando detalles importantes, especialmente para Windows 11, y conectándolo con la filosofía de WinScript, tal como hicimos con el documento anterior.

La clave aquí es:

1. **Comandos más robustos y relevantes para Windows 11**: Algunos de los comandos de Windows mencionados son muy básicos o tienen equivalentes más potentes en PowerShell. Los actualizaremos.
2. **Contexto de WinScript**: Sugeriremos cómo cada optimización podría ser una opción en `WINSCRIPTsettings.json` o una sección en `WinScript Online.md`.
3. **Tier List Implícita**: Aunque el documento no se llama "Tier List", la idea de impacto se mantiene, resaltando la relevancia de cada ajuste.

Aquí tienes el documento retroalimentado y detallado:

---

### 🛠️ System Optimization Scripts: Minimalist Cross-Platform Cheatsheet

**ADVERTENCIA CRÍTICA:** La manipulación de configuraciones de sistema puede tener consecuencias no deseadas.

- **Siempre crea un punto de restauración del sistema** antes de aplicar cambios significativos.
- **Ejecuta la Símbolo del sistema (CMD) o PowerShell como Administrador.**

---

### Índice

- Optimización General del Sistema
- Gestión de Memoria
- Optimización de Almacenamiento (SSD/HDD)
- Optimización de Seguridad
- Optimización de Red
  - Limpieza de Caché DNS
  - Configuración de Firewall
- Limpieza de Cachés y Archivos Temporales
  - Limpieza de Idiomas No Usados
  - Limpieza de Cachés de Fuentes
  - Eliminar Archivos Temporales Específicos (`.DS_Store` equivalentes)
- Ajustes Visuales y de Interfaz (UI)
- Scripts de Mantenimiento Programado
  - Limpiar Registros (Logs) del Sistema
- Gestión de Energía
- Monitoreo del Sistema

---

### Optimización General del Sistema

Estos ajustes buscan mejorar el rendimiento global del sistema al modificar parámetros del núcleo o límites de recursos.

#### Windows 11 (PowerShell, como Admin)

- **Aumentar Conexiones TCP y Handles de Archivos:** Windows gestiona esto de forma más dinámica que Linux/macOS. Las optimizaciones de registro suelen enfocarse en aspectos específicos del driver de red o aplicaciones.
  - **Contexto WinScript:** Estas configuraciones son de bajo nivel y rara vez necesitan ser ajustadas manualmente a menos que haya problemas específicos de red o aplicaciones que manejen muchísimas conexiones. No hay una opción directa en `WINSCRIPTsettings.json` actualmente, pero se podrían agregar como `tcp_connections_boost` o `file_handles_optimization` para usuarios avanzados.

<!-- end list -->

PowerShell

```
# Aumentar conexiones TCP (ejemplo, el valor predeterminado suele ser suficiente para la mayoría)
# Este es un valor más conceptual para Windows; la gestión de conexiones es más compleja.
# netsh int tcp set global maxconnectionper10s=100
# Sin embargo, la optimización más efectiva se enfoca en el TCP Auto-Tuning y ECN Capability
# (Ver sección "Optimización de Red" para estos comandos).
```

---

### Gestión de Memoria

Acciones para liberar y optimizar el uso de la RAM.

#### Windows 11 (PowerShell)

- **Liberar Memoria:** Windows maneja activamente la memoria. Forzar su liberación como `purge` en macOS no es típicamente beneficioso y puede ser contraproducente. Reiniciar procesos o usar herramientas nativas es más seguro.
  - **Contexto WinScript:** La opción `cleantemp` y `cleanmgr` en `WINSCRIPTsettings.json` ya cubre la limpieza de archivos temporales que pueden estar cargados en memoria caché. Un `memory_optimization` podría añadirse para estas acciones.

<!-- end list -->

PowerShell

```
# Vaciar la Papelera de Reciclaje
Clear-RecycleBin -Force

# Reiniciar el proceso del Explorador de Archivos (libera memoria de la UI)
Stop-Process -Name "explorer" -Force
Start-Process "explorer"
```

---

### Optimización de Almacenamiento (SSD/HDD)

Mantenimiento y ajustes específicos para unidades de almacenamiento.

#### Windows 11 (PowerShell, como Admin)

- **Optimizar Unidades (TRIM para SSDs, Desfragmentación para HDDs):** Esencial para la salud y el rendimiento.
  - **Contexto WinScript:** Ya tienes la opción `storagesense` que se relaciona, pero la ejecución explícita de `Optimize-Volume` podría ser una nueva opción como `optimize_drives` en `WINSCRIPTsettings.json`.

<!-- end list -->

PowerShell

```
# Analiza y optimiza todas las unidades del sistema.
# Para SSDs, esto ejecuta TRIM. Para HDDs, desfragmenta.
Optimize-Volume -Analyze -All -Verbose
Optimize-Volume -Defrag -All -Verbose
```

---

### Optimización de Seguridad

Configuraciones básicas para fortalecer la seguridad del sistema.

#### Windows 11 (PowerShell, como Admin)

- **Activar Firewall:** Fundamental para proteger tu sistema.
  - **Contexto WinScript:** Puedes añadir `enable_firewall` en `WINSCRIPTsettings.json`.

<!-- end list -->

PowerShell

```
# Asegura que los perfiles del firewall (Dominio, Público, Privado) estén habilitados.
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
```

---

### Optimización de Red

Ajustes para mejorar la latencia y el rendimiento de la red.

#### Windows 11 (PowerShell, como Admin)

- **Ajustes Avanzados de Red:** Windows 11 prioriza el ajuste automático. Modificar el registro solo se recomienda para usuarios avanzados con problemas específicos.
  - **Contexto WinScript:** `cloudflaredns`, `googledns`, etc., ya cubren los DNS. Las optimizaciones de TCP son de un nivel más profundo y podrían ser una opción avanzada como `advanced_network_tweaks`.

<!-- end list -->

PowerShell

```
# Habilitar TCP Auto-Tuning (generalmente ya habilitado por defecto y es óptimo)
# Mejora el rendimiento en redes modernas al ajustar dinámetros de ventana.
netsh int tcp set global autotuninglevel=normal

# Habilitar Notificación de Congestión Explícita (ECN)
# Ayuda a los routers a notificar la congestión sin descartar paquetes.
netsh int tcp set global ecncapability=enabled

# Deshabilitar Algoritmo de Nagle (puede reducir latencia para juegos, a costa de más paquetes pequeños)
# NECESITARÁS EL GUID DE TU ADAPTADOR DE RED (ver ejemplos anteriores o la sección Wi-Fi específica)
# $wifiGuid = (Get-NetAdapter -Name "Wi-Fi").InterfaceGuid
# reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$wifiGuid" /v TcpNoDelay /t REG_DWORD /d 1 /f
# reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$wifiGuid" /v TcpAckFrequency /t REG_DWORD /d 1 /f
```

---

### Limpieza de Cachés

Liberar espacio y mejorar el rendimiento eliminando archivos temporales y cachés.

#### Limpieza de Caché DNS

- **Contexto WinScript:** Esta es una buena práctica y se podría agregar una opción `flush_dns` en `WINSCRIPTsettings.json`.

<!-- end list -->

PowerShell

```
ipconfig /flushdns
```

#### Configuración de Firewall

- **Contexto WinScript:** Cubierto por `enable_firewall` propuesto anteriormente.

<!-- end list -->

PowerShell

```
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
```

#### Limpieza de Cachés y Archivos Temporales

- **Contexto WinScript:** `cleantemp` y `cleanmgr` ya existen o están propuestos en `WINSCRIPTsettings.json`. Puedes añadir un `delete_user_caches`.

<!-- end list -->

PowerShell

```
# Limpiar archivos temporales de usuario
Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue

# Limpiar caché de la tienda de Windows
wsreset.exe -c
```

#### Limpieza de Idiomas No Usados

- **Contexto WinScript:** Esta es una excelente opción de limpieza. Se puede añadir `remove_unused_languages` en `WINSCRIPTsettings.json`.

<!-- end list -->

PowerShell

```
# Obtener la lista actual de idiomas instalados
$LangList = Get-WinUserLanguageList

Write-Host "Idiomas instalados actualmente:"
$LangList | ForEach-Object { Write-Host "- $($_.LanguageTag) ($($_.LocalizedDisplayName))" }

# Ejemplo de cómo remover un idioma (ej. "es-MX") si no es el idioma principal
# Asegúrate de no remover tu idioma principal o el único.
# Se recomienda que el usuario especifique qué idiomas remover o que el script le pida confirmación.
# Para remover "es-MX":
# if ($LangList.Count -gt 1) { # Asegurarse de que no sea el único idioma
#     $LangListToRemove = $LangList | Where-Object { $_.LanguageTag -eq "es-MX" }
#     if ($LangListToRemove) {
#         $LangList.Remove($LangListToRemove)
#         Set-WinUserLanguageList $LangList -Force
#         Write-Host "Idioma es-MX eliminado."
#     }
# } else {
#     Write-Host "Solo hay un idioma instalado, no se puede eliminar." -ForegroundColor Yellow
# }
```

#### Limpieza de Cachés de Fuentes

- **Contexto WinScript:** Aunque no hay un comando directo, esta es una buena "práctica avanzada". Puede ser parte de una opción `font_cache_cleanup`.

<!-- end list -->

PowerShell

```
# No hay un comando directo de PowerShell/CMD para esto en Windows 11 como en macOS/Linux.
# La gestión de la caché de fuentes se maneja a nivel de sistema.
# Para forzar una "limpieza", a veces reiniciar el servicio "Administrador de fuentes de Windows" puede ayudar:
# Stop-Service -Name "FontCache" -Force -ErrorAction SilentlyContinue
# Start-Service -Name "FontCache" -ErrorAction SilentlyContinue
```

#### Eliminar Archivos `.DS_Store` (equivalentes)

- **Contexto WinScript:** No aplica directamente, pero si hay archivos de sistema ocultos generados por otras plataformas o software, una opción `remove_hidden_temp_files` podría ser útil.

<!-- end list -->

PowerShell

```
# No aplica directamente .DS_Store.
# Si necesitas buscar y eliminar archivos ocultos por nombre:
# Get-ChildItem -Path C:\ -Recurse -Include "*.thumbs", "*.tmp" -Force | Remove-Item -Force -ErrorAction SilentlyContinue
```

---

### Ajustes Visuales y de Interfaz (UI)

Mejorar la respuesta de la UI deshabilitando animaciones y efectos.

#### Windows 11

- **Desactivar Animaciones Visuales:** Mejora la fluidez en hardware limitado.
  - **Contexto WinScript:** Ya cubierto por la opción `VisualFxSetting` en `WINSCRIPTsettings.json` o una nueva `disable_visual_effects`.

<!-- end list -->

PowerShell

```
# Desactivar animaciones, sombras, transparencias. Hace la UI "más seca" y rápida.
# Este comando ya lo hemos visto, es muy efectivo.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFxSetting /t REG_DWORD /d 2 /f
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012038010000000 /f

# Reiniciar el explorador para aplicar cambios de inmediato
Stop-Process -Name "explorer" -Force
Start-Process "explorer"
```

---

### Scripts de Mantenimiento Programado

Tareas periódicas para mantener el sistema saludable.

#### Windows 11

- **Ejecutar Mantenimiento Automático:** Windows 11 ya tiene un mantenimiento automático programado.
  - **Contexto WinScript:** Puedes tener una opción `run_system_maintenance` en `WINSCRIPTsettings.json`.

<!-- end list -->

PowerShell

```
# Iniciar el mantenimiento programado de Windows ahora.
# Esto incluye desfragmentación, limpieza, y otras tareas en segundo plano.
Start-ScheduledTask -TaskPath "\Microsoft\Windows\Maintanence" -TaskName "Maintanence"
```

#### Limpiar Registros (Logs) del Sistema

- **Contexto WinScript:** Una opción `clear_system_logs` en `WINSCRIPTsettings.json` sería útil.

<!-- end list -->

PowerShell

```
# Limpiar logs de eventos del sistema y aplicaciones.
# Ten cuidado, esto borra el historial de eventos.
wevtutil cl System
wevtutil cl Application
wevtutil cl Security
wevtutil cl Setup
```

---

### Gestión de Energía

Controlar los modos de energía para rendimiento o ahorro.

#### Windows 11

- **Modo Ahorro de Energía / Máximo Rendimiento:** Cambiar el plan de energía.
  - **Contexto WinScript:** Ya tienes `ultimateperformance` en `WINSCRIPTsettings.json`.

<!-- end list -->

PowerShell

```
# Activar el plan de Máximo Rendimiento (GUID para la mayoría de los sistemas)
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

# Para activar el plan de Ahorro de Energía (GUID común)
# powercfg /setactive a1841308-3541-4fab-bc81-f71556f20b4a

# Para listar todos los planes:
# powercfg /list
```

---

### Monitoreo del Sistema

Comandos para obtener información sobre el estado del sistema.

```
# Información detallada del sistema
Get-ComputerInfo | Format-List

# Procesos en ejecución (similar a 'top' o 'htop')
Get-Process | Sort-Object CPU -Descending | Select-Object -First 20

# Uso de memoria
Get-Counter "\Memory\Available MBytes"
Get-Counter "\Memory\% Committed Bytes In Use"

# Estado de la batería
Get-WmiObject -Class Win32_Battery
```

---

Este documento ahora está mucho más completo para Windows 11 con comandos más apropiados y sugerencias de integración en tu sistema WinScript. ¡Es una excelente referencia multiplataforma!

```powershell
# Ajustes avanzados de red requieren edición de registro o herramientas de terceros.
```

---

## Flush DNS Cache

**macOS**

```bash
sudo dscacheutil -flushcache
sudo killall -HUP mDNSResponder
```

**Linux**

```bash
sudo systemd-resolve --flush-caches
# O para sistemas con nscd:
sudo service nscd restart
```

**Windows 11**

```powershell
ipconfig /flushdns
```

---

## Firewall

**macOS**

```bash
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
```

**Linux**

```bash
sudo ufw enable
```

**Windows 11**

```powershell
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
```

---

## Limpieza de Cachés

**macOS**

```bash
sudo rm -rf ~/Library/Caches/*
sudo rm -rf /Library/Caches/*
```

**Linux**

```bash
sudo rm -rf ~/.cache/*
sudo rm -rf /var/cache/*
```

**Windows 11**

```powershell
# Limpiar caché de usuario
Remove-Item -Path "$env:LOCALAPPDATA\Temp\*" -Recurse -Force
```

---

## Limpieza de Idiomas No Usados

**macOS**

```bash
sudo rm -rf /System/Library/CoreServices/Language\ Chooser.app
```

**Linux**

```bash
sudo apt-get autoremove language-pack-XX
```

**Windows 11**

```powershell
# Quitar idiomas no usados
Get-WinUserLanguageList
# Para eliminar:
$LangList = Get-WinUserLanguageList
$LangList.RemoveAll({$_.LanguageTag -eq "es-MX"})
Set-WinUserLanguageList $LangList -Force
```

---

## Limpieza de Cachés de Fuentes

**macOS**

```bash
sudo atsutil databases -remove
sudo atsutil server -shutdown
sudo atsutil server -ping
```

**Linux**

```bash
sudo fc-cache -fv
```

**Windows 11**

```powershell
# No hay comando directo, pero puedes limpiar fuentes desde Configuración > Personalización > Fuentes
```

---

## Eliminar Archivos .DS_Store

**macOS y Linux**

```bash
find . -name '.DS_Store' -depth -exec rm {} \;
```

**Windows 11**

```powershell
# .DS_Store no aplica, pero puedes buscar y eliminar archivos ocultos similares si los hay.
```

---

## Desactivar Spotlight

**macOS**

```bash
sudo mdutil -a -i off
```

**Linux/Windows 11**

> No aplica.

---

## Desactivar Dashboard

**macOS**

```bash
defaults write com.apple.dashboard mcx-disabled -boolean YES
killall Dock
```

**Linux/Windows 11**

> No aplica.

---

## Desactivar Animaciones

**macOS**

```bash
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write com.apple.dock launchanim -bool false
killall Dock
```

**Linux (Gnome)**

```bash
gsettings set org.gnome.desktop.interface enable-animations false
```

**Windows 11**

```powershell
# Desactivar animaciones visuales
SystemPropertiesPerformance.exe
# O desde Configuración > Accesibilidad > Efectos visuales
```

---

## Optimizar Dock

**macOS**

```bash
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock expose-animation-duration -float 0
defaults write com.apple.dock springboard-show-duration -int 0
defaults write com.apple.dock springboard-hide-duration -int 0
killall Dock
```

**Linux (Gnome)**

```bash
gsettings set org.gnome.shell.extensions.dash-to-dock animate-show-apps false
```

**Windows 11**

> No aplica (el dock es la barra de tareas, personalizable desde Configuración).

---

## Verificar Permisos de Disco

**macOS**

```bash
sudo diskutil verifyPermissions /
```

**Linux**

```bash
sudo fsck -Af -V
```

**Windows 11**

```powershell
chkdsk C: /F
```

---

## Scripts de Mantenimiento

**macOS**

```bash
sudo periodic daily weekly monthly
```

**Linux**

```bash
sudo updatedb
sudo apt-get update && sudo apt-get upgrade
```

**Windows 11**

```powershell
# Ejecutar mantenimiento automático
MSchedExe.exe Start
```

---

## Limpiar Logs del Sistema

**macOS**

```bash
sudo rm -rf /var/log/*
```

**Linux**

```bash
sudo journalctl --vacuum-time=7d
sudo rm -rf /var/log/*
```

**Windows 11**

```powershell
wevtutil cl System
wevtutil cl Application
```

---

## Resetear SMC

**macOS (solo Intel)**

1. Apaga tu MacBook.
2. Mantén presionadas Shift + Control + Option + Power por 10 segundos.
3. Suelta todas las teclas y enciende el Mac.

**Linux/Windows 11**

> No aplica.

---

## Modo Ahorro de Energía

**macOS**

```bash
sudo pmset -a lowpowermode 1
```

**Linux**

```bash
sudo systemctl start tlp
```

**Windows 11**

```powershell
powercfg /setactive SCHEME_MAX
```

---

## AutoBoot (Solo Intel)

**macOS (Intel)**

```bash
sudo nvram AutoBoot=%00   # Desactivar
sudo nvram AutoBoot=%03   # Activar
```

**Linux/Windows 11**

> No aplica.

---

## Estado MDM

**macOS**

```bash
sudo profiles show -type enrollment
```

**Linux/Windows 11**

> No aplica (MDM es específico de Apple).

---

## Monitoreo del Sistema

**macOS**

```bash
top
vm_stat
pmset -g batt
system_profiler SPDisplaysDataType
```

**Linux**

```bash
top
free -h
lshw -C display
upower -i /org/freedesktop/UPower/devices/battery_BAT0
```

**Windows 11**

```powershell
Get-ComputerInfo
Get-Process
Get-WmiObject win32_battery
```

---

¿Quieres que agregue alguna sección extra o detalle específico para algún sistema operativo?