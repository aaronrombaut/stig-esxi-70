$myVMS = Get-VM | Where-Object {$_.Name -cnotlike "vCLS-*"} | Sort-Object Name

Write-Host -NoNewline "Number of virtual machines: "
Write-Host -ForegroundColor Yellow $myVMS.Length

foreach ($myVM in $myVMS) {
    Write-host -NoNewline "Host name: "
    Write-Host -ForegroundColor Yellow $myVM.Name

    # Check text
    Get-VM $myVM | Get-HardDisk | Select-Object Parent, Name, Filename, DiskType, Persistence | Format-Table -AutoSize
    
    # Fix text
#    Get-VM $myVM | Get-HardDisk | Set-HardDisk -Persistence Persistent
}