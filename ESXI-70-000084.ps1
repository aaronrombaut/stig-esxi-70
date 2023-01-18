$vmHosts = Get-VMHost | Sort-Object Name

# $auditRecordsDirectory = ""

Write-Host "Number of hosts:" $vmHosts.Length
foreach ($vmHost in $vmHosts)
{
    Write-host "Host name:" $vmHost.Name

    $esxcli = Get-EsxCli -VMHost $vmHost -v2
    

    # Check
#    $esxcli.system.auditrecords.get.invoke()|Format-List

     # Fix
    $arguments = $esxcli.system.auditrecords.local.set.CreateArgs()
#   *Optional* 
#   $arguments.directory = $auditRecordsDirectory
    $arguments.size="100"
    $esxcli.system.auditrecords.local.set.Invoke($arguments)
    $esxcli.system.auditrecords.local.enable.Invoke()
    $esxcli.system.auditrecords.remote.enable.Invoke()
}