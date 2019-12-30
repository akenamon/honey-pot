# Honey pot

# A container in which honey is kept

This is an effort to create a fake shell, with a week password


If somebody is trying to hack into your machine,
they will probably  try ssh into it first,
using   very week pass .


When it happend, the action we be register by rsyslog,
that is running on another container.

It is script to test if somebody logged in , 
each ten minutes.

If positive  this alarm will apear.

'''
DANGER!! Somebody want to hack us! 
'''


Do not forget to move you real ssh to a diferent port first, 
and never use passwords for authentication on your real one,
always use pubkey to log in.






### --------------------------------------------------------------


# Usage


~$ git clone https://github.com/akenamon/honey-pot.git

### We must change  directory

~$ cd honey-pot

### give exec permission 

~$ chmod +x setup.sh 

### run as root

~$ sudo ./setup.sh 

