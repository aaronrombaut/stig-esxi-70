$myVMS = Get-VM | Where-Object {$_.Name -cnotlike "vCLS-*"} | Sort-Object Name

Write-Host -NoNewline "Number of virtual machines: "
Write-Host -ForegroundColor Yellow $myVMS.Length

foreach ($myVM in $myVMS) {
    Write-host -NoNewline "Host name: "
    Write-Host -ForegroundColor Yellow $myVM.Name

    # Check text
#    Get-VM -Name $myVM | Get-CDDrive | Where-Object {$_.extensiondata.connectable.connected -eq $true} | Select-Object Parent,Name
    
    # Fix text
    Get-VM -Name $myVM | Get-CDDrive | Set-CDDrive -NoMedia -Confirm:$false
}