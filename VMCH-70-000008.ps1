$myVMS = Get-VM | Where-Object {$_.Name -cnotlike "vCLS-*"} | Sort-Object Name
$advancedSetting = ""

Write-Host -NoNewline "Number of virtual machines: "
Write-Host -ForegroundColor Yellow $myVMS.Length

foreach ($myVM in $myVMS) {
    Write-host -NoNewline "Host name: "
    Write-Host -ForegroundColor Yellow $myVM.Name

    # Check text
#    Get-VM -Name $myVM | Get-FloppyDrive | Select Parent, Name, ConnectionState | Format-Table -AutoSize

    # Fix text
    if ($(Get-VM -Name $myVM).PowerState -like "PoweredOn") {
        Write-Host -ForegroundColor Red "Virtual machine is powered on. Please power off and run again."
    } else {
        Get-VM  -Name $myVM | Get-FloppyDrive | Remove-FloppyDrive -Confirm:$false
    }
    
}