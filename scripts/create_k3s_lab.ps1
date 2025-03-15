. $PSScriptRoot\common.ps1

Add-LabVM -VMName k3s-lab-server-0 `
    -ImageUrl "http://nexus.infrastructure.asio:8081/repository/raw/hyperv/hyperv_debian_12.9-0.vhdx" `
    -MemorySize 20GB `
    -CpuCount 4
Add-LabVM -VMName k3s-lab-agent-0 `
    -ImageUrl "http://nexus.infrastructure.asio:8081/repository/raw/hyperv/hyperv_debian_12.9-0.vhdx" `
    -MemorySize 20GB `
    -CpuCount 4
Add-LabVM -VMName k3s-lab-agent-1 `
    -ImageUrl "http://nexus.infrastructure.asio:8081/repository/raw/hyperv/hyperv_debian_12.9-0.vhdx" `
    -MemorySize 20GB `
    -CpuCount 4
