$myVMS = Get-VM | Where-Object {$_.Name -cnotlike "vCLS-*"} | Sort-Object Name

Write-Host -NoNewline "Number of virtual machines: "
Write-Host -ForegroundColor Yellow $myVMS.Length

foreach ($myVM in $myVMS) {
    Write-host -NoNewline "Host name: "
    Write-Host -ForegroundColor Yellow $myVM.Name

    # Check text
#    Get-VM -Name $myVM | Get-AdvancedSetting -Name "pciPassthru*.present" | Select-Object Entity, Name, Value
    
    # Fix text
    ## Change the X value to match the specific setting ##
#    Get-VM -Name $myVM | Get-AdvancedSetting -Name pciPassthruX.present | Remove-AdvancedSetting
}