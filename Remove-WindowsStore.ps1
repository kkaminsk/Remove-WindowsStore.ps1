# Powershell script to modify registry

# The registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer"

# The name of the property to modify
$PropertyName = "NoPinningStoreToTaskbar"

# The new value for the property
$PropertyValue = 1

# Check if the path exists
if (!(Test-Path $RegPath)) {
    # If the path does not exist, create it
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the property value
Set-ItemProperty -Path $RegPath -Name $PropertyName -Value $PropertyValue