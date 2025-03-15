# Lab Environment

## Features
* Runs on hyperv
* Powershell script to create all VMs
* Basic SOE (node_exporter)
* Containerized services running in own VMs (for on/off ability):
    * ldap
    * mssql
* PostgreSQL server (todo)
* Confluent Platform VMs (infra only - no software deployment)
* Lab Kubernetes cluster (K3S)

## VM creation (Windows)
* `scripts` directory

## Ansible Setup

```shell
ansible -m venv venv
pip install ansible-core

# before every use
. ./venv/bin/activate
```

## Test connectivity

```shell
# pick one
ansible -i inventories/hosts.yml -m ping debian
ansible -i inventories/hosts.yml -m ping rhel
ansible -i inventories/hosts.yml -m ping k3s_lab
ansible -i inventories/hosts.yml -m ping infrastructure
ansible -i inventories/hosts.yml -m ping cp_ansible
```

## SOE

```shell
ansible-playbook -i inventories/hosts.yml playbooks/rhel_soe.yml -l redhat
ansible-playbook -i inventories/hosts.yml playbooks/debian_soe.yml -l debian
```

## Infrastructure

### LDAP

LDIF, etc based on [https://github.com/confluentinc/confluent-kubernetes-examples/tree/master/assets/openldap](https://github.com/confluentinc/confluent-kubernetes-examples/tree/master/assets/openldap) for interoperability.

```shell
# LDAP
ansible-playbook -i inventories/hosts.yml playbooks/podman.yml -l lab-ldap-0.lab.asio
```

Test:

```shell
$ ssh lab-ldap-0.lab.asio
Last login: Wed Feb 12 00:15:01 2025 from 10.10.255.122
[geoff@lab-ldap-0 ~]$ sudo -s
[root@lab-ldap-0 geoff]# podman exec -ti openldap-app bash
1001@openldap:/$
```

```shell
ldapsearch -LLL -x -H ldap://localhost:389 -b 'dc=test,dc=com' -D "cn=mds,dc=test,dc=com" -w 'Developer!'
```

### MSSQL
`sa` password:

```shell
mkdir ~/.mssql/
openssl rand -base64 16 | tr -dc 'A-Za-z0-9_@%&*!?+=-' > ~/.mssql/lab_mssql_password.txt
```

Deploy:

```shell
ansible-playbook -i inventories/hosts.yml playbooks/podman.yml -l lab-mssql-0.lab.asio
```

Test:
```shell
# on lab-mssql-0.lab.asio
nc -vz localhost 1433
```

### PostgreSQL

todo

## K3S

### Generate token

```shell
openssl rand -base64 64 > ~/.k3s-lab-token
```

### Deploy K3s
```shell
cd k3s-ansible
ansible-playbook playbooks/site.yml -i ../inventories/k3s_lab.yml -l k3s_lab
```

### Destroy cluster
```shell
ansible -i inventories/k3s_lab.yml -m ansible.builtin.shell server -a 'sudo bash -c "k3s-killall.sh ; k3s-uninstall.sh ; reboot"'
ansible -i inventories/k3s_lab.yml -m ansible.builtin.shell agent -a 'sudo bash -c "k3s-killall.sh ; k3s-agent-uninstall.sh ; reboot"'
```


## Troubleshooting

### BitsTransfer (BITS)
Used to download from nexus: [BitsTransfer](https://learn.microsoft.com/en-us/powershell/module/bitstransfer/?view=windowsserver2025-ps)?

#### Broken BITS service
```
Start-BitsTransfer : Object reference not set to an instance of an object.
At line:1 char:1
+ Start-BitsTransfer -Source "https://speed.hetzner.de/100MB.bin" -Dest ...
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : NotSpecified: (:) [Start-BitsTransfer], NullReferenceException
    + FullyQualifiedErrorId : System.NullReferenceException,Microsoft.BackgroundIntelligentTransfer.Management.NewBits
   TransferCommand
```

Try BitsTransfer troubleshooter: Settings -> Troubleshoot -> Other troubleshooters -> Background Intelligent Transfer Service

#### Broken OS 
In some cases, BITS operation fails and then it _also_ fails to display an error correctly:

```
bits transfer  The resource loader cache doesn't have loaded MUI entry. (0x80073B01)
```

This is because OS language support is broken. Probably the non-US locale is broken for some reason. Try to reinstall langage pack, eg: go to windows language settings uninstall "Australian" then reinstall "Australian" and reboot.
