. $PSScriptRoot\common.ps1

Add-LabVM -VMName lab-schema-registry-0 `
    -ImageUrl "http://nexus.infrastructure.asio:8081/repository/raw/hyperv/hyperv_alma_8.10-0.vhdx" `
    -MemorySize 2GB `
    -CpuCount 1
Add-LabVM -VMName lab-schema-registry-1 `
    -ImageUrl "http://nexus.infrastructure.asio:8081/repository/raw/hyperv/hyperv_alma_8.10-0.vhdx" `
    -MemorySize 2GB `
    -CpuCount 1
Add-LabVM -VMName lab-connect-0 `
    -ImageUrl "http://nexus.infrastructure.asio:8081/repository/raw/hyperv/hyperv_alma_8.10-0.vhdx" `
    -MemorySize 2GB `
    -CpuCount 2
Add-LabVM -VMName lab-zookeeper-0 `
    -ImageUrl "http://nexus.infrastructure.asio:8081/repository/raw/hyperv/hyperv_alma_8.10-0.vhdx" `
    -MemorySize 1GB `
    -CpuCount 1
Add-LabVM -VMName lab-zookeeper-1 `
    -ImageUrl "http://nexus.infrastructure.asio:8081/repository/raw/hyperv/hyperv_alma_8.10-0.vhdx" `
    -MemorySize 2GB `
    -CpuCount 1
Add-LabVM -VMName lab-zookeeper-2 `
    -ImageUrl "http://nexus.infrastructure.asio:8081/repository/raw/hyperv/hyperv_alma_8.10-0.vhdx" `
    -MemorySize 2GB `
    -CpuCount 1
Add-LabVM -VMName lab-kafka-0 `
    -ImageUrl "http://nexus.infrastructure.asio:8081/repository/raw/hyperv/hyperv_alma_8.10-0.vhdx" `
    -MemorySize 4GB `
    -CpuCount 2
Add-LabVM -VMName lab-kafka-1 `
    -ImageUrl "http://nexus.infrastructure.asio:8081/repository/raw/hyperv/hyperv_alma_8.10-0.vhdx" `
    -MemorySize 4GB `
    -CpuCount 2
Add-LabVM -VMName lab-kafka-2 `
    -ImageUrl "http://nexus.infrastructure.asio:8081/repository/raw/hyperv/hyperv_alma_8.10-0.vhdx" `
    -MemorySize 4GB `
    -CpuCount 2
Add-LabVM -VMName lab-ksql-0 `
    -ImageUrl "http://nexus.infrastructure.asio:8081/repository/raw/hyperv/hyperv_alma_8.10-0.vhdx" `
    -MemorySize 4GB `
    -CpuCount 1
Add-LabVM -VMName lab-control-center-0 `
    -ImageUrl "http://nexus.infrastructure.asio:8081/repository/raw/hyperv/hyperv_alma_8.10-0.vhdx" `
    -MemorySize 6GB `
    -CpuCount 2

