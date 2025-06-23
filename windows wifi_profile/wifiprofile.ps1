# Definir el contenido del perfil XML
$wifiProfileXml = @"
<?xml version="1.0"?>
<WLANProfile xmlns="http://www.microsoft.com/networking/WLAN/profile/v1">
    <name>ARRIS-4B30-5G</name>
    <SSIDConfig>
        <SSID>
            <name>ARRIS-4B30-5G</name>
        </SSID>
    </SSIDConfig>
    <connectionMode>auto</connectionMode>
    <MSM>
        <security>
            <authEncryption>
                <authentication>WPA2PSK</authentication>
                <encryption>AES</encryption>
                <useOneX>false</useOneX>
            </authEncryption>
            <sharedKey>
                <keyType>passPhrase</keyType>
                <protected>false</protected>
                <keyMaterial>F0AF854C4B30</keyMaterial>
            </sharedKey>
        </security>
    </MSM>
</WLANProfile>
"@

# Definir la ruta temporal para el archivo XML
$tempXmlPath = "$env:TEMP\wifi_profile_arris.xml"

# Guardar el contenido XML en el archivo temporal
Set-Content -Path $tempXmlPath -Value $wifiProfileXml -Encoding UTF8

# Importar el perfil Wi-Fi
netsh wlan add profile filename="$tempXmlPath" user=current

# Conectar a la red
netsh wlan connect name="ARRIS-4B30-5G"

# (Opcional) Eliminar el archivo temporal
Remove-Item -Path $tempXmlPath -Force