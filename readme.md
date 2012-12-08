# irclog.iq.harvard.edu

http://irclog.iq.harvard.edu displays logs collected by a [bot][] on [Freenode][] called "iqlogbot".

This git repo contains the configuration of the bot.

Testing is done in [Vagrant][] before changes are pushed into production.

[Vagrant]: http://vagrantup.com

## Making changes to this repo

- git clone
- vagrant up
- vagrant ssh
- sudo su -
- service iptables stop
- exit
- vim
- vagrant provision
- git commit
- git push

## Pushing changes into production

- git clone (once)
- git pull
- git clone ilbot
- puppet apply

[bot]: http://en.wikipedia.org/wiki/Internet_Relay_Chat_bot
[Freenode]: http://freenode.net

     [06:12] [pdurbin(+i)] [1:freenode (change with ^X)] [Act: 11]                  
    [(status)] /join #dvn



    06:12 -!- pdurbin [~pdurbin@ice1.fas.harvard.edu] has joined #dvn
    06:12 -!- ServerMode/#dvn [+ns] by wolfe.freenode.net
    06:12 [Users #dvn]
    06:12 [@pdurbin] 
    06:12 -!- Irssi: #dvn: Total of 1 nicks [1 ops, 0 halfops, 0 voices, 0 normal]
    06:12 -!- Channel #dvn created Fri Dec  7 06:12:33 2012
    06:12 -!- Irssi: Join to #dvn was synced in 0 secs


     [06:12] [@pdurbin(+i)] [13:freenode/#dvn(+ns)] [Act: 11]                       
    [#dvn] 
