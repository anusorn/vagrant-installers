if not exist "C:\Windows\Temp\msys2.exe" (
  powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::TLS12; (New-Object System.Net.WebClient).DownloadFile('https://github.com/msys2/msys2-installer/releases/download/2020-07-20/msys2-x86_64-20200720.exe', 'C:\Windows\Temp\msys2.exe')" <NUL
)

cmd /c "C:\Windows\Temp\msys2.exe -v --platform minimal --script A:\msys2-install.qs"

taskkill /IM "gpg-agent.exe" /F
taskkill /IM "dirmngr.exe" /F
