Function main {
Get-OSInfo
Get-MemoryInfo
}

function Get-OSInfo {
<#
.SYNOPSIS
Returns OS version, edition and other information
#>

Write-Output "--- Version, Edition ---"
Get-WmiObject -Class win32_operatingsystem | select Caption, Version, OSArchitecture, ServicePackMajorVersion, ServicePackMinorVersion, WindowsDirectory, Status
}

function Get-MemoryInfo {
<#
.SYNOPSIS
Returns basic information about real and virtual memory.
#>

    $pfsetting = Get-WmiObject -Class win32_PageFileSetting | select Name, MaximumSize |format-table
    Write-Output "--- Memory, Pagefile ---"
    if ($pfsetting -eq $null) {
        "Default system managed pagefile."
    } else {
        $pfsetting
    }

    gwmi win32_operatingsystem | select TotalVisibleMemorySize, 
        SizeStoredInPagingFiles, FreeVirtualMemory, FreeSpaceInPagingFiles, 
        FreePhysicalMemory  #needs nicer formatting.
}

main

