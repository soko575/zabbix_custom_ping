# zabbix_custom_ping
**INSTALLATION AND CONFIGURATION**

1.Add Bash scripts on host, from which you want to ping
2.Change all the parameters as you need them.
3.Add USERPARAMETER in zabbix-agent.conf file

    UserParameter=ping.loss[*], /etc/zabbix/scripts/custom_pinger/packet_loss.sh $1
    UserParameter=ping.response[*], /etc/zabbix/scripts/custom_pinger/response_time.sh $1
4.Save file and change mod for execute.

    chmod +x packet_loss.sh 
    chmod +x response_time.sh
5.Restart zabbix-agent.service

6.Import tempate to Zabbix UI and add it to hosts.

Attention!!! 
You must add the host names to which pings will be sent in the Macros section of the host. 
{$HOST1}, {$HOST2}, {$HOST3}
