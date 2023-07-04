# Remove-WindowsStore
This script is written in PowerShell and is designed to run as part of the device deployment process in Microsoft. Its purpose is to remove the Microsoft Store icon from the taskbar on Windows 11 machines during deployment without any configuration via Group Policy.

The script first defines a registry path related to Windows Explorer policies. If this registry path does not already exist, the script creates it.

Next, it specifies the name and value of a DWORD registry entry ("NoPinningStoreToTaskbar" with a value of 1) that corresponds to the display setting of the Store icon on the taskbar.

The script then checks for the existence of this DWORD in the previously specified registry path. If the DWORD does not exist or its current value differs from the desired value (1), the script creates or modifies the DWORD accordingly.

By setting the value of "NoPinningStoreToTaskbar" to 1, the Microsoft Store icon is prevented from being pinned to the taskbar, thereby hiding it from users.

This script is intended to be assigned to a device and is only tested for Windows 11, as specified in the comments. Changes made by this script will affect all users on the device.
