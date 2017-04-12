#!/bin/bash
CURRENT_IP=$(curl -s 'https://api.ipify.org')
if [[ "${CURRENT_IP}" != $(cat ~/.myIp) ]]
then
	$(sendemail -q -l email.log -f "emailfor@froml.field" -u "**IP CHANGED**subject" -t "emailtosend@notification.to" -s "smtp.gmail.com:587" -o "tls=yes" -xu "yourusername@gmail.com" -xp "yourpassword" -m "New IP ==  $CURRENT_IP.  \nBody of email - I use a link to my dns provider here")
$(echo $CURRENT_IP > .myIp)
fi
