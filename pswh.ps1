Function main {
Get-OSInfo
}

function Get-OSInfo {
<#
.SYNOPSIS
Returns OS version, edition and other information
#>

Get-WmiObject -Class win32_operatingsystem | select Caption, Version, OSArchitecture, ServicePackMajorVersion, ServicePackMinorVersion, WindowsDirectory, Status
}

main

