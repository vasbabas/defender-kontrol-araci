@echo off
:: Batch dosyasinin Yönetici olarak calistirilip calistirilmadigini kontrol et
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Bu programin duzgun calismasi icin Yonetici olarak calistirmaniz gerekiyor...
    pause
    exit
)

echo Windows Defender devre disi birakiliyor...
echo Lutfen bekleyin...

:: PowerShell komutlari ile Defender ozelliklerini kapatiyoruz
powershell -ExecutionPolicy Bypass -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
powershell -ExecutionPolicy Bypass -Command "Set-MpPreference -DisableScanningNetworkFiles $true"
powershell -ExecutionPolicy Bypass -Command "Set-MpPreference -DisableBlockAtFirstSeen $true"

:: Kayit Defteri (Registry) ayarini ekliyoruz
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f

echo.
echo Islem tamamlandi! Windows Defender basariyla devre disi birakildi.
echo Degisikliklerin tam olarak uygulanmasi icin bilgisayarinizi yeniden baslatmaniz onerilir.
echo.
pause