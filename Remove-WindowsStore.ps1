# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer"

# Check if the registry path exists, create it if it does not
if (!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Define the name of the DWORD and its value
$dwordName = "NoPinningStoreToTaskbar"
$dwordValue = 1

# Check if the DWORD exists, create/modify it if it does not/is incorrect
if ((Get-ItemProperty -Path $registryPath -Name $dwordName -ErrorAction SilentlyContinue).$dwordName -ne $dwordValue) {
    New-ItemProperty -Path $registryPath -Name $dwordName -Value $dwordValue -PropertyType DWORD -Force | Out-Null
}