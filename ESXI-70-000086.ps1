$vmHosts = Get-VMHost | Sort-Object Name

Write-Host "Number of hosts:" $vmHosts.Length
foreach ($vmHost in $vmHosts)
{
    Write-host "Host name:" $vmHost.Name
 
    # Check
    Get-VMHost -Name $vmHost | Get-AdvancedSetting -Name Syslog.global.logCheckSSLCerts

     # Fix

}