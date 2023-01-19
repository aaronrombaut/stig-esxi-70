$myVMS = Get-VM | Where-Object {$_.Name -cnotlike "vCLS-*"} | Sort-Object Name

Write-Host -NoNewline "Number of virtual machines: "
Write-Host -ForegroundColor Yellow $myVMS.Length

foreach ($myVM in $myVMS) {
    Write-host -NoNewline "Host name: "
    Write-Host -ForegroundColor Yellow $myVM.Name

    # Check text
    Get-VM -Name $myVM | Where-Object {($_.ExtensionData.Config.MigrateEncryption -ne "opportunistic") -or ($_.ExtensionData.Config.MigrateEncryption -ne "required")}

    # Fix text
    $spec = New-Object VMware.Vim.VirtualMachineConfigSpec
    $spec.MigrateEncryption = New-Object VMware.Vim.VirtualMachineConfigSpecEncryptedVMotionModes
    $spec.MigrateEncryption = $true
    (Get-VM -Name $myVM).ExtensionData.ReconfigVM($spec)
}