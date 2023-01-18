$vmHosts = Get-VMHost | Sort-Object Name
Write-Host "Number of hosts:" $vmHosts.Length
foreach ($vmHost in $vmHosts) {
    Write-host "Host name:" $vmHost.Name
    $theMode = Get-VMHost -Name $vmHost | Select Name,@{N="Lockdown";E={$_.Extensiondata.Config.LockdownMode}}

    switch ( $theMode.Lockdown )
    {
        'lockdownNormal' { Write-host -ForegroundColor Green "Not a Finding (NF)" }
        'lockdownStrict' { Write-host -ForegroundColor Green "Not a Finding (NF)" }
        'lockdownDisabled' { Write-host -ForegroundColor Red "Open (O)" }
    }
}