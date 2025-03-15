$ErrorActionPreference = "Stop"
function Add-LabVM {
    param (
        [string]$ImageUrl,
        [string]$VMName,
        [int64]$MemorySize,
        [int64]$CpuCount
    )
    $VMVhdx = "D:\hyperv\vhds\$VMName.vhdx"
    write-host "=================[$VMName]================="

    if (! (Test-Path $VMVhdx)) {
        Write-Host "download $ImageUrl to $VMVhdx"
        Start-BitsTransfer -Source $ImageUrl -Destination $VMVhdx
    }

    if (! (Get-VM -Name $VMName -ErrorAction SilentlyContinue)) {
        Write-Host "create VM $VMName, memory: $MemorySize"
        New-VM -Name $VMName -MemoryStartupBytes $MemorySize -Path "D:\hyperv\Virtual Machines" -VHDPath $VMVhdx -Generation 2 -SwitchName "bridge"
        Set-VMFirmware -VMName $VMName -SecureBootTemplate MicrosoftUEFICertificateAuthority
        Set-Vm -ProcessorCount $CpuCount -Name $VMName
        Set-VMMemory -DynamicMemoryEnabled $false -VMName $VMName
        Set-VMNetworkAdapterVlan -VMName $VMName -Access -VlanId 70
    }
    write-host "=========================================="
}

