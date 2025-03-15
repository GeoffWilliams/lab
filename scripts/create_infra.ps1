. $PSScriptRoot\common.ps1

Add-LabVM  -VMName lab-ldap-0 `
    -ImageUrl "http://nexus.infrastructure.asio:8081/repository/raw/hyperv/hyperv_alma_9.5-0.vhdx" `
    -MemorySize 4GB `
    -CpuCount 1
Add-LabVM  -VMName lab-mssql-0 `
    -ImageUrl "http://nexus.infrastructure.asio:8081/repository/raw/hyperv/hyperv_alma_9.5-0.vhdx" `
    -MemorySize 4GB `
    -CpuCount 2

Add-LabVM  -VMName lab-postgresql-0 `
    -ImageUrl "http://nexus.infrastructure.asio:8081/repository/raw/hyperv/hyperv_alma_9.5-0.vhdx" `
    -MemorySize 2GB `
    -CpuCount 1