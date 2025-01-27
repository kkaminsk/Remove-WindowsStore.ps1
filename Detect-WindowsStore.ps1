# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer"

# Check if the registry path exists, create it if it does not
if (!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Define the name of the DWORD and its expected value
$dwordName = "NoPinningStoreToTaskbar"
$expectedValue = 1

# Check if the DWORD exists and has the expected value
$currentValue = (Get-ItemProperty -Path $registryPath -Name $dwordName -ErrorAction SilentlyContinue).$dwordName

if ($currentValue -ne $expectedValue) {
    # Return failure code if the value is not equal to the expected value
    Write-Output "Registry value does not match the expected value. Current value: $currentValue, Expected value: $expectedValue"
    exit 1
} else {
    # Optionally, indicate success
    Write-Output "Registry value matches the expected value."
}
