#!/bin/sh

echo STIG ID: ESXI-70-000009
echo Expected result: Banner /etc/issue
/usr/lib/vmware/openssh/bin/sshd -T | grep -i Banner
echo -------------------------------------------------

echo STIG ID: ESXI-70-000012
echo Expected result: IgnoreRHosts yes
/usr/lib/vmware/openssh/bin/sshd -T | grep -i IgnoreRHosts
echo -------------------------------------------------

echo STIG ID: ESXI-70-000013
echo Expected result: HostBasedAuthentication no
/usr/lib/vmware/openssh/bin/sshd -T | grep -i HostBasedAuthentication
echo -------------------------------------------------

echo STIG ID: ESXI-70-000015
echo Expected result: PermitEmptyPasswords no
/usr/lib/vmware/openssh/bin/sshd -T | grep -i PermitEmptyPasswords
echo -------------------------------------------------

echo STIG ID: ESXI-70-000016
echo Expected result: PermitUserEnvironment no
/usr/lib/vmware/openssh/bin/sshd -T | grep -i PermitUserEnvironment
echo -------------------------------------------------

echo STIG ID: ESXI-70-000020
echo Expected result: StrictModes yes
/usr/lib/vmware/openssh/bin/sshd -T | grep -i StrictModes
echo -------------------------------------------------

echo STIG ID: ESXI-70-000021
echo Expected result: Compression no
/usr/lib/vmware/openssh/bin/sshd -T | grep -i Compression
echo -------------------------------------------------

echo STIG ID: ESXI-70-000022
echo Expected result: GatewayPorts no
/usr/lib/vmware/openssh/bin/sshd -T | grep -i GatewayPorts
echo -------------------------------------------------

echo STIG ID: ESXI-70-000023
echo Expected result: X11Forwarding no
/usr/lib/vmware/openssh/bin/sshd -T | grep -i X11Forwarding
echo -------------------------------------------------

echo STIG ID: ESXI-70-000025
echo Expected result: PermitTunnel no
/usr/lib/vmware/openssh/bin/sshd -T | grep -i PermitTunnel
echo -------------------------------------------------
 
echo STIG ID: ESXI-70-000026
echo Expected result: ClientAliveCountMax 3
/usr/lib/vmware/openssh/bin/sshd -T | grep -i ClientAliveCountMax
echo -------------------------------------------------
 
echo STIG ID: ESXI-70-000027
echo Expected result: ClientAliveInterval 200
/usr/lib/vmware/openssh/bin/sshd -T | grep -i ClientAliveInterval
echo -------------------------------------------------
 
echo STIG ID: ESXI-70-000082
echo Expected result: AllowTCPForwarding no
/usr/lib/vmware/openssh/bin/sshd -T | grep -i AllowTCPForwarding
echo -------------------------------------------------

echo STIG ID: ESXI-70-000274
echo Expected result: Ciphers aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr
/usr/lib/vmware/openssh/bin/sshd -T | grep -i Ciphers
