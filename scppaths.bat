@echo off
setlocal enabledelayedexpansion

:: Çıktı dosyasının adı
set "output=sphereresources.txt"

:: Başlık kısımlarını dosyaya yazdırıyoruz
echo [RESOURCES] > "%output%"
echo // sphere.ini and spheretable.scp are automatic. >> "%output%"
echo. >> "%output%"
echo //////////////////////// >> "%output%"
echo // Core folder >> "%output%"
echo //////////////////////// >> "%output%"
echo. >> "%output%"
echo. >> "%output%"
echo. >> "%output%"
echo //////////////////////// >> "%output%"
echo // Defnames folder >> "%output%"
echo //////////////////////// >> "%output%"
echo. >> "%output%"
echo. >> "%output%"

:: Mevcut dizindeki ve alt dizinlerdeki tüm .scp dosyalarını tarıyoruz
for /f "delims=" %%i in ('dir /b /s /a-d *.scp') do (
    set "filepath=%%i"
    
    :: Tam yoldan, mevcut çalışma dizini yolunu çıkararak göreceli yolu (relative path) buluyoruz
    set "relpath=!filepath:%CD%\=!"
    
    :: Windows'un ters eğik çizgisini (\) düz eğik çizgiye (/) çeviriyoruz
    set "relpath=!relpath:\=/!"
    
    :: Sonucu dosyaya ekliyoruz
    echo !relpath! >> "%output%"
)

echo Islem tamamlandi. Sonuclar %output% dosyasina yazildi.
pause