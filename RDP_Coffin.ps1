Set-LocalUser -Name "Administrator" -Password (ConvertTo-SecureString -AsPlainText "$PASSWORD" -Force)
Get-LocalUser -Name "Administrator" | Enable-LocalUser 
Invoke-WebRequest https://raw.githubusercontent.com//BlackJoker9/rdpw/main/ngrok-stable-windows-amd64.zip -OutFile ngrok.zip
tar xf ngrok.zip
Copy ngrok.exe C:\Windows\System32
Start-Service -Name audiosrv
cmd /c echo ./ngrok.exe authtoken "$NGROK" >a.ps1
cmd /c echo cmd /k start ngrok.exe tcp 3389 >>a.ps1
 Write-Host "Visit: https://dashboard.ngrok.com/endpoints/status to get NGROK IP"
.\a.ps1
