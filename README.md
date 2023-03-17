# iptas
Simple bash scripts to reject connections from well-known spam sender, attackers and not responding to abuse sysadmins. :cursing_face:
<br>
(will update from time to time)
<br><br>
:warning: :warning: :warning: <b>Please keep in mind:</b> :warning: :warning: :warning:
<br>
everybody should decide for himself/herself/the company somebody is working for what SPAM/threat/unwanted means when using these scripts
<br><br>
These scipts do a lookup for the related AS and add them as a separate INPUT chain to iptables, so in case something goes wrong you can simply delete this.
<br><br>
<b>Required software:</b>
<br>
bash, iptables, sed, curl, jq, aggregate
<br><br>
You can also use these scripts to prevent general access to your maintained server from various threads. The scripts wit -as.sh at the end block whole AS while the others might just have a list of ip addresses inside.
<br>
And from time to time you need to delete and re-run the scripts, because some AS which were full of spammers simply don't exist anymore :sunglasses:
