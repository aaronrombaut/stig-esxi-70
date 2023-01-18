$vmHosts = Get-VMHost | Sort-Object Name
Write-Host "Number of hosts:" $vmHosts.Length
foreach ($vmHost in $vmHosts) {
    Write-host "Host name:" $vmHost.Name
    Get-VMHost -Name $vmHost | Get-AdvancedSetting -Name Syslog.global.logHost | Format-Table -AutoSize
#    Get-VMHost -Name $vmHost | Get-AdvancedSetting -Name Syslog.global.logHost | Set-AdvancedSetting -Value "" -Confirm:$false
}