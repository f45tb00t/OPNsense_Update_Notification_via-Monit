- Place check_opnsense_update.sh in /usr/local/bin && chmod ...

Monit
Service Tests Settings:
=> create new Test Setting <=
Name: check_opnsense_update
Condition: status != 0
Action: Alert

Service Settings
=> create new Servcice Setting <=
Name: OPNsense_Update_Check
Type: Custom
Path: /usr/local/bin/check_opnsense_update.sh
Tests: check_opnsense_update
Poll Time: 00 01 * * *
Description: OPNsense_Update_Check daily

Alert Setting
=> create new Alert Setting <=
Enable Alert: Check
Recipient: <your_mail_addy>
Events: status failed
Mail Format:
from: [OPNsense_configured@mail.com]
reply-to: [<your_mail_addy>]
subject: Monit Alert -- $EVENT
message: $EVENT Service $SERVICE

Date: $DATE
Action: $ACTION
Description: $DESCRIPTION


General Settings:
- configure your outgoing mail...


Check Status...

Output will be like:
Program 'OPNsense_Update_Check'
  status                       OK
  monitoring status            Waiting
  monitoring mode              active
  on reboot                    start
  last exit value              0
  last output                  NO_UPDATE: Current version: OPNsense 24.7.9_1 (amd64)
  data collected               Mon, 02 Dec 2024 01:01:50
