$myVMS = Get-VM | Where-Object {$_.Name -cnotlike "vCLS-*"} | Sort-Object Name

Write-Host -NoNewline "Number of virtual machines: "
Write-Host -ForegroundColor Yellow $myVMS.Length

foreach ($myVM in $myVMS) {
    Write-host -NoNewline "Host name: "
    Write-Host -ForegroundColor Yellow $myVM.Name

    # Check text
    Get-VM -Name $myVM | Where-Object {$_.ExtensionData.Config.Flags.EnableLogging -ne "True"}
    
    # Fix text
<#     $spec = New-Object VMware.Vim.VirtualMachineConfigSpec
    $spec.Flags = New-Object VMware.Vim.VirtualMachineFlagInfo
    $spec.Flags.enableLogging = $true
    (Get-VM -Name $myVM).ExtensionData.ReconfigVM($spec) #>
}