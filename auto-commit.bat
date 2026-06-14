@echo off
cd /d "%~dp0"
echo ======================================================
echo Memulai Auto Commit dan Push ke GitHub...
echo ======================================================

:: Cek status git
git status -s

:: Tambahkan semua perubahan
git add .

:: Commit dengan pesan otomatis menggunakan tanggal dan waktu
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set datetime=%%I
set date_time=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2% %datetime:~8,2%:%datetime:~10,2%:%datetime:~12,2%
git commit -m "Auto Update: %date_time%"

:: Push ke repository
git push origin main

echo.
echo ======================================================
echo Proses Selesai!
echo ======================================================
pause
