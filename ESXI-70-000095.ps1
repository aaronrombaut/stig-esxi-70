$vmHosts = Get-VMHost | Sort-Object Name

Write-Host "Number of hosts:" $vmHosts.Length
foreach ($vmHost in $vmHosts)
{
    Write-host "Host name:" $vmHost.Name

    $esxcli = Get-EsxCli -VMHost $vmHost -v2

    # Check
#    $esxcli.system.settings.encryption.get.invoke() | Select-Object RequireSecureBoot

    # Fix
    $arguments = $esxcli.system.settings.encryption.set.CreateArgs()
    $arguments.requiresecureboot = $true
    $esxcli.system.settings.encryption.set.Invoke($arguments)
    
}