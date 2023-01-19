$myVMS = Get-VM | Where-Object {$_.Name -cnotlike "vCLS-*"} | Sort-Object Name

Write-Host -NoNewline "Number of virtual machines: "
Write-Host -ForegroundColor Yellow $myVMS.Length

foreach ($myVM in $myVMS) {
    Write-host -NoNewline "Host name: "
    Write-Host -ForegroundColor Yellow $myVM.Name

    # Check text
    Get-VM -Name $myVM | Get-AdvancedSetting -Name "ethernet*.filter*.name*"
    
    # Fix text
<#     Write-Host "Change the X and Y values and run the following command: "
    Write-Host "Get-VM 'VM Name' | Get-AdvancedSetting -Name ethernetX.filterY.name | Remove-AdvancedSetting" #>
}