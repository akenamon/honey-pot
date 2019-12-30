#!/bin/bash

echo '
#!/bin/bash
 check_security_state()
{ 
        _trigger=$(docker logs rsyslog   2> /dev/null | egrep -m1 -o 'DANGER' )
        if [ ! -z $_trigger ] ;then 
                if [ "$_trigger" == "DANGER" ] ; then
                        echo "DANGER!! Somebody want to hack us!" | /usr/bin/wall 
                fi
        fi

}

check_security_state 
' > /usr/local/bin/ssh-trapper-check.sh && \
chmod +x /usr/local/bin/ssh-trapper-check.sh


echo 'SHELL=/bin/bash
PATH=/usr/local/bin:/usr/bin:/bin
*/10 * * * * root /bin/bash -c /usr/local/bin/ssh-trapper-check.sh
#' > /etc/cron.d/ssh-trapper-check
