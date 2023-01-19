$myVMS = Get-VM | Where-Object {$_.Name -cnotlike "vCLS-*"} | Sort-Object Name

Write-Host -NoNewline "Number of virtual machines: "
Write-Host -ForegroundColor Yellow $myVMS.Length

foreach ($myVM in $myVMS) {
    Write-host -NoNewline "Host name: "
    Write-Host -ForegroundColor Yellow $myVM.Name

    # Check text
#    Get-VM -Name $myVM | Where-Object {($_.ExtensionData.Config.FtEncryptionMode -ne "ftEncryptionOpportunistic") -and ($_.ExtensionData.Config.FtEncryptionMode -ne "ftEncryptionRequired")}
    
    # Fix text
    $spec = New-Object VMware.Vim.VirtualMachineConfigSpec
    $spec.FTEncryption = New-Object VMware.Vim.VMware.Vim.VirtualMachineConfigSpecEncryptedFtModes
    $spec.FT = ftEncryptionOpportunistic    #ftEncryptionOpportunistic or ftEncryptionRequired
    (Get-VM -Name $myVM).ExtensionData.ReconfigVM($spec)
}