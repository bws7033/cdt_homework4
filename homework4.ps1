# This script will loop forever and block the ports of
# two common network services both inbound and outbound randomly

# Loop forever
while (1 -eq 1) {
    # Get two different random number between 0 and 8
    $rand1 = Get-Random -Maximum 9
    do {
        $rand2 = Get-Random -Maximum 9
    } until ($rand1 -ne $rand2)
    
    # Block prots based on random number
    if ($rand1 -eq 0 -or $rand2 -eq 0) {
        # Blocking HTTP
        New-NetFirewallRule -DisplayName 'HTTP-Inbound' -Profile @('Domain', 'Private', 'Public') -Direction Inbound -Action Block -Protocol TCP -LocalPort @('80', '8080')
        New-NetFirewallRule -DisplayName 'HTTP-Outbound' -Profile @('Domain', 'Private', 'Public') -Direction Outbound -Action Block -Protocol TCP -LocalPort @('80', '8080')
    }
    if ($rand1 -eq 1 -or $rand2 -eq 1) {
        # Blocking HTTPS
        New-NetFirewallRule -DisplayName 'HTTPS-Inbound' -Profile @('Domain', 'Private', 'Public') -Direction Inbound -Action Block -Protocol TCP -LocalPort @('443', '8443')
        New-NetFirewallRule -DisplayName 'HTTPS-Outbound' -Profile @('Domain', 'Private', 'Public') -Direction Outbound -Action Block -Protocol TCP -LocalPort @('443', '8443')
    }
    if ($rand1 -eq 2 -or $rand2 -eq 2) {
        # Blocking DHCP both TCP and UDP
        New-NetFirewallRule -DisplayName 'DHCP-Inbound-TCP' -Profile @('Domain', 'Private', 'Public') -Direction Inbound -Action Block -Protocol TCP -LocalPort @('88')
        New-NetFirewallRule -DisplayName 'DHCP-Outbound-TCP' -Profile @('Domain', 'Private', 'Public') -Direction Outbound -Action Block -Protocol TCP -LocalPort @('88')
        New-NetFirewallRule -DisplayName 'DHCP-Inbound-UDP' -Profile @('Domain', 'Private', 'Public') -Direction Inbound -Action Block -Protocol UDP -LocalPort @('68', '88')
        New-NetFirewallRule -DisplayName 'DHCP-Outbound-UDP' -Profile @('Domain', 'Private', 'Public') -Direction Outbound -Action Block -Protocol UDP -LocalPort @('68', '88')
    }
    if ($rand1 -eq 3 -or $rand2 -eq 3) {
        # Blocking NTP
        New-NetFirewallRule -DisplayName 'NTP-Inbound' -Profile @('Domain', 'Private', 'Public') -Direction Inbound -Action Block -Protocol UDP -LocalPort @('123')
        New-NetFirewallRule -DisplayName 'NTP-Outbound' -Profile @('Domain', 'Private', 'Public') -Direction Outbound -Action Block -Protocol UDP -LocalPort @('123')
    }
    if ($rand1 -eq 4 -or $rand2 -eq 4) {
        # Blocking DNS both TCP and UDP
        New-NetFirewallRule -DisplayName 'DNS-Inbound-TCP' -Profile @('Domain', 'Private', 'Public') -Direction Inbound -Action Block -Protocol TCP -LocalPort @('53')
        New-NetFirewallRule -DisplayName 'DNS-Outbound-TCP' -Profile @('Domain', 'Private', 'Public') -Direction Outbound -Action Block -Protocol TCP -LocalPort @('53')
        New-NetFirewallRule -DisplayName 'DNS-Inbound-UDP' -Profile @('Domain', 'Private', 'Public') -Direction Inbound -Action Block -Protocol UDP -LocalPort @('53')
        New-NetFirewallRule -DisplayName 'DNS-Outbound-UDP' -Profile @('Domain', 'Private', 'Public') -Direction Outbound -Action Block -Protocol UDP -LocalPort @('53')
    }
    if ($rand1 -eq 5 -or $rand2 -eq 5) {
        # Blocking FTP
        New-NetFirewallRule -DisplayName 'FTP-Inbound' -Profile @('Domain', 'Private', 'Public') -Direction Inbound -Action Block -Protocol TCP -LocalPort @('20', '21')
        New-NetFirewallRule -DisplayName 'FTP-Outbound' -Profile @('Domain', 'Private', 'Public') -Direction Outbound -Action Block -Protocol TCP -LocalPort @('20', '21')
    }
    if ($rand1 -eq 6 -or $rand2 -eq 6) {
        # Blocking SSH
        New-NetFirewallRule -DisplayName 'SSH-Inbound' -Profile @('Domain', 'Private', 'Public') -Direction Inbound -Action Block -Protocol TCP -LocalPort @('22')
        New-NetFirewallRule -DisplayName 'SSH-Outbound' -Profile @('Domain', 'Private', 'Public') -Direction Outbound -Action Block -Protocol TCP -LocalPort @('22')
    }
    if ($rand1 -eq 7 -or $rand2 -eq 7) {
        # Blocking SMTP
        New-NetFirewallRule -DisplayName 'SMTP-Inbound' -Profile @('Domain', 'Private', 'Public') -Direction Inbound -Action Block -Protocol TCP -LocalPort @('25', '587')
        New-NetFirewallRule -DisplayName 'SMTP-Outbound' -Profile @('Domain', 'Private', 'Public') -Direction Outbound -Action Block -Protocol TCP -LocalPort @('25', '587')
    }
    if ($rand1 -eq 8 -or $rand2 -eq 8) {
        # Blocking LDAP both TCP and UDP
        New-NetFirewallRule -DisplayName 'LDAP-Inbound-TCP' -Profile @('Domain', 'Private', 'Public') -Direction Inbound -Action Block -Protocol TCP -LocalPort @('389', '636')
        New-NetFirewallRule -DisplayName 'LDAP-Outbound-TCP' -Profile @('Domain', 'Private', 'Public') -Direction Outbound -Action Block -Protocol TCP -LocalPort @('389', '636')
        New-NetFirewallRule -DisplayName 'LDAP-Inbound-UDP' -Profile @('Domain', 'Private', 'Public') -Direction Inbound -Action Block -Protocol UDP -LocalPort @('389', '636')
        New-NetFirewallRule -DisplayName 'LDAP-Outbound-UDP' -Profile @('Domain', 'Private', 'Public') -Direction Outbound -Action Block -Protocol UDP -LocalPort @('389', '636')
    }

    # Sleep for five minutes
    Start-Sleep -Seconds 300
}