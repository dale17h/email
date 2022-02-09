# --- Set Values
$saltstack = 'saltprod'
#$saltstack
$minion    = hostname
#$minion

# --- Create Directory
New-Item -Path "c:\" -Name "SMCTEMP" -ItemType "directory"

# --- Download Salt Minion Install File
Invoke-WebRequest -Uri https://repo.saltproject.io/windows/Salt-Minion-3003.1-Py3-AMD64-Setup.exe -OutFile C:\SMCTemp\Salt-Minion-3003.1-Py3-AMD64-Setup.exe

# --- Set install arguments
$parameters = '/master=' + $saltstack + ' /minion-name=' + $minion
#$parameters
# --- Run the Install
Start-Process C:\SMCTemp\Salt-Minion-3003.1-Py3-AMD64-Setup.exe -ArgumentList "/S $parameters" -Wait -NoNewWindow -PassThru | Out-Null
 