$myVMS = Get-VM | Where-Object {$_.Name -cnotlike "vCLS-*"} | Sort-Object Name
$advancedSetting = "tools.guest.desktop.autolock"

Write-Host -NoNewline "Number of virtual machines: "
Write-Host -ForegroundColor Yellow $myVMS.Length

foreach ($myVM in $myVMS) {
    Write-host -NoNewline "Host name: "
    Write-Host -ForegroundColor Yellow $myVM.Name

    # Check text
#    Get-VM $myVM | Get-AdvancedSetting -Name $advancedSetting | Format-Table -AutoSize

    # Fix text
    if (Get-VM $myVM | Get-AdvancedSetting -Name $advancedSetting) {
        # "Exists"
        Get-VM $myVM | Get-AdvancedSetting -Name $advancedSetting | Set-AdvancedSetting -Value true -Confirm:$false
    } else {
        # "Does not exist"
        Get-VM $myVM | New-AdvancedSetting -Name $advancedSetting -Value true -Confirm:$false
        Get-VM $myVM | Get-AdvancedSetting -Name $advancedSetting | Set-AdvancedSetting -Value true -Confirm:$false
    }
}