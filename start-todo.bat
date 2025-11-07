@echo off
:menu
cls
echo.
echo ================================================
echo     TODO APP V2 - CONTROL PANEL
echo ================================================
echo.
echo [1] Rebuild & Jalankan Container
echo [2] Cek Isi Container (/app)
echo [3] Cek Isi Templates
echo [4] Cek Isi Static
echo [5] Lihat Log Container (50 baris terakhir)
echo [6] Buka Browser
echo [7] Keluar
echo.
set /p choice="Pilih [1-7]: "

if "%choice%"=="1" goto rebuild
if "%choice%"=="2" goto list_app
if "%choice%"=="3" goto list_templates
if "%choice%"=="4" goto list_static
if "%choice%"=="5" goto show_logs
if "%choice%"=="6" goto open_browser
if "%choice%"=="7" goto exit

echo.
echo PILIHAN TIDAK VALID!
pause >nul
goto menu

:: ================================================
:rebuild
echo.
echo [1] Bersihkan container & image lama...
docker stop todo-container >nul 2>&1
docker rm todo-container >nul 2>&1
docker rmi todo-app:latest >nul 2>&1

echo [2] Build image baru...
docker build -t todo-app:latest . || (
    echo.
    echo BUILD GAGAL!
    pause
    goto menu
)

echo [3] Jalankan container...
docker run -d -p 5000:5000 --name todo-container todo-app:latest || (
    echo.
    echo CONTAINER GAGAL JALAN!
    pause
    goto menu
)

echo [4] Tunggu 15 detik...
timeout /t 15 >nul

echo [5] Cek aplikasi...
curl -f http://localhost:5000 >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo APLIKASI TIDAK RESPONS!
    docker logs todo-container
    pause
    goto menu
)

echo.
echo APLIKASI BERHASIL JALAN!
pause
goto menu

:: ================================================
:list_app
echo.
echo --- ISI FOLDER /app ---
docker exec todo-container ls -la /app 2>nul || echo Container tidak jalan!
echo.
pause
goto menu

:list_templates
echo.
echo --- ISI /app/templates ---
docker exec todo-container ls -la /app/templates 2>nul || echo Tidak ada!
echo.
echo --- PREVIEW index.html (10 baris pertama) ---
docker exec todo-container head -10 /app/templates/index.html 2>nul
echo.
pause
goto menu

:list_static
echo.
echo --- ISI /app/static ---
docker exec todo-container ls -la /app/static 2>nul || echo Tidak ada!
echo.
pause
goto menu

:: ================================================
:show_logs
echo.
echo --- LOG CONTAINER (50 baris terakhir) ---
echo Tekan sembarang tombol untuk kembali ke menu...
docker logs todo-container --tail 50 2>nul || echo Container tidak jalan!
echo.
pause
goto menu

:: ================================================
:open_browser
start http://localhost:5000
echo.
echo Browser dibuka!
pause
goto menu

:: ================================================
:exit
echo.
echo Sampai jumpa!
timeout /t 2 >nul
exit