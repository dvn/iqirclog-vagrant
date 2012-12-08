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

## First time deploy to production

    [root@dvn-5 ~]# git clone https://github.com/dvn/iqirclog-vagrant.git
    Initialized empty Git repository in /root/iqirclog-vagrant/.git/
    remote: Counting objects: 64, done.
    remote: Compressing objects: 100% (41/41), done.
    remote: Total 64 (delta 0), reused 64 (delta 0)
    Unpacking objects: 100% (64/64), done.
    [root@dvn-5 ~]# 
    [root@dvn-5 ~]# cd iqirclog-vagrant
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# git submodule init
    Submodule 'modules/epel' (https://github.com/stahnma/puppet-module-epel) registered for path 'modules/epel'
    Submodule 'modules/mysql' (https://github.com/puppetlabs/puppetlabs-mysql) registered for path 'modules/mysql'
    Submodule 'modules/stdlib' (https://github.com/puppetlabs/puppetlabs-stdlib) registered for path 'modules/stdlib'
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# git submodule update
    Initialized empty Git repository in /root/iqirclog-vagrant/modules/epel/.git/
    remote: Counting objects: 54, done.
    remote: Compressing objects: 100% (36/36), done.
    remote: Total 54 (delta 20), reused 49 (delta 15)
    Unpacking objects: 100% (54/54), done.
    Submodule path 'modules/epel': checked out '4fc5b13bc3182af7348ce4878cdc882884c358cb'
    Initialized empty Git repository in /root/iqirclog-vagrant/modules/mysql/.git/
    remote: Counting objects: 1097, done.
    remote: Compressing objects: 100% (506/506), done.
    remote: Total 1097 (delta 611), reused 970 (delta 513)
    Receiving objects: 100% (1097/1097), 167.04 KiB, done.
    Resolving deltas: 100% (611/611), done.
    Submodule path 'modules/mysql': checked out 'af4b8bff0ad59f21211be2a98d31588066c41e0c'
    Initialized empty Git repository in /root/iqirclog-vagrant/modules/stdlib/.git/
    remote: Counting objects: 3026, done.
    remote: Compressing objects: 100% (1155/1155), done.
    remote: Total 3026 (delta 1561), reused 2931 (delta 1498)
    Receiving objects: 100% (3026/3026), 419.24 KiB, done.
    Resolving deltas: 100% (1561/1561), done.
    Submodule path 'modules/stdlib': checked out '2df66c041109ecca1099bf3977657572cc32ad24'
    [root@dvn-5 iqirclog-vagrant]# 

    [root@dvn-5 iqirclog-vagrant]# yum install puppet
    Loaded plugins: fastestmirror, priorities, protectbase, security, versionlock
    Loading mirror speeds from cached hostfile
     * base: mirror.metrocast.net
     * centos_extras: mirror.metrocast.net
     * epel: mirror.seas.harvard.edu
     * extras: mirror.metrocast.net
     * puias_6_core_base: www.puias.princeton.edu
     * puias_6_unsupported: www.puias.princeton.edu
     * rpmforge: mirror.us.leaseweb.net
     * updates: centos.mirror.constant.com
    8762 packages excluded due to repository priority protections
    0 packages excluded due to repository protections
    Setting up Install Process
    Resolving Dependencies
    --> Running transaction check
    ---> Package puppet.noarch 0:2.6.17-2.el6 will be installed
    --> Processing Dependency: ruby(abi) = 1.8 for package: puppet-2.6.17-2.el6.noarch
    --> Processing Dependency: ruby >= 1.8.5 for package: puppet-2.6.17-2.el6.noarch
    --> Processing Dependency: facter >= 1.5 for package: puppet-2.6.17-2.el6.noarch
    --> Processing Dependency: ruby(shadow) for package: puppet-2.6.17-2.el6.noarch
    --> Processing Dependency: ruby(selinux) for package: puppet-2.6.17-2.el6.noarch
    --> Processing Dependency: ruby(augeas) for package: puppet-2.6.17-2.el6.noarch
    --> Processing Dependency: /usr/bin/ruby for package: puppet-2.6.17-2.el6.noarch
    --> Running transaction check
    ---> Package facter.x86_64 0:1.6.6-1.el6 will be installed
    ---> Package libselinux-ruby.x86_64 0:2.0.94-5.3.el6 will be installed
    ---> Package ruby.x86_64 0:1.8.7.352-7.el6_2 will be installed
    ---> Package ruby-augeas.x86_64 0:0.4.1-1.el6 will be installed
    --> Processing Dependency: augeas-libs >= 0.8.0 for package: ruby-augeas-0.4.1-1.el6.x86_64
    --> Processing Dependency: libaugeas.so.0(AUGEAS_0.8.0)(64bit) for package: ruby-augeas-0.4.1-1.el6.x86_64
    --> Processing Dependency: libaugeas.so.0(AUGEAS_0.12.0)(64bit) for package: ruby-augeas-0.4.1-1.el6.x86_64
    --> Processing Dependency: libaugeas.so.0(AUGEAS_0.11.0)(64bit) for package: ruby-augeas-0.4.1-1.el6.x86_64
    --> Processing Dependency: libaugeas.so.0(AUGEAS_0.10.0)(64bit) for package: ruby-augeas-0.4.1-1.el6.x86_64
    --> Processing Dependency: libaugeas.so.0(AUGEAS_0.1.0)(64bit) for package: ruby-augeas-0.4.1-1.el6.x86_64
    --> Processing Dependency: libaugeas.so.0()(64bit) for package: ruby-augeas-0.4.1-1.el6.x86_64
    ---> Package ruby-libs.x86_64 0:1.8.7.352-7.el6_2 will be installed
    ---> Package ruby-shadow.x86_64 0:1.4.1-13.el6 will be installed
    --> Running transaction check
    ---> Package augeas-libs.x86_64 0:0.9.0-4.el6 will be installed
    --> Finished Dependency Resolution

    Dependencies Resolved

    ================================================================================
     Package               Arch         Version                    Repository  Size
    ================================================================================
    Installing:
     puppet                noarch       2.6.17-2.el6               epel       815 k
    Installing for dependencies:
     augeas-libs           x86_64       0.9.0-4.el6                base       317 k
     facter                x86_64       1.6.6-1.el6                epel        69 k
     libselinux-ruby       x86_64       2.0.94-5.3.el6             base        99 k
     ruby                  x86_64       1.8.7.352-7.el6_2          base       532 k
     ruby-augeas           x86_64       0.4.1-1.el6                epel        21 k
     ruby-libs             x86_64       1.8.7.352-7.el6_2          base       1.6 M
     ruby-shadow           x86_64       1.4.1-13.el6               epel        11 k

    Transaction Summary
    ================================================================================
    Install       8 Package(s)

    Total download size: 3.5 M
    Installed size: 11 M
    Is this ok [y/N]: y
    Downloading Packages:
    (1/8): augeas-libs-0.9.0-4.el6.x86_64.rpm                | 317 kB     00:00     
    (2/8): facter-1.6.6-1.el6.x86_64.rpm                     |  69 kB     00:00     
    (3/8): libselinux-ruby-2.0.94-5.3.el6.x86_64.rpm         |  99 kB     00:00     
    (4/8): puppet-2.6.17-2.el6.noarch.rpm                    | 815 kB     00:00     
    (5/8): ruby-1.8.7.352-7.el6_2.x86_64.rpm                 | 532 kB     00:00     
    (6/8): ruby-augeas-0.4.1-1.el6.x86_64.rpm                |  21 kB     00:00     
    (7/8): ruby-libs-1.8.7.352-7.el6_2.x86_64.rpm            | 1.6 MB     00:00     
    (8/8): ruby-shadow-1.4.1-13.el6.x86_64.rpm               |  11 kB     00:00     
    --------------------------------------------------------------------------------
    Total                                           5.2 MB/s | 3.5 MB     00:00     
    Running rpm_check_debug
    Running Transaction Test
    Transaction Test Succeeded
    Running Transaction
      Installing : ruby-libs-1.8.7.352-7.el6_2.x86_64                           1/8 
      Installing : ruby-1.8.7.352-7.el6_2.x86_64                                2/8 
      Installing : facter-1.6.6-1.el6.x86_64                                    3/8 
      Installing : ruby-shadow-1.4.1-13.el6.x86_64                              4/8 
      Installing : augeas-libs-0.9.0-4.el6.x86_64                               5/8 
      Installing : ruby-augeas-0.4.1-1.el6.x86_64                               6/8 
      Installing : libselinux-ruby-2.0.94-5.3.el6.x86_64                        7/8 
      Installing : puppet-2.6.17-2.el6.noarch                                   8/8 
      Verifying  : ruby-1.8.7.352-7.el6_2.x86_64                                1/8 
      Verifying  : ruby-augeas-0.4.1-1.el6.x86_64                               2/8 
      Verifying  : libselinux-ruby-2.0.94-5.3.el6.x86_64                        3/8 
      Verifying  : augeas-libs-0.9.0-4.el6.x86_64                               4/8 
      Verifying  : ruby-libs-1.8.7.352-7.el6_2.x86_64                           5/8 
      Verifying  : puppet-2.6.17-2.el6.noarch                                   6/8 
      Verifying  : ruby-shadow-1.4.1-13.el6.x86_64                              7/8 
      Verifying  : facter-1.6.6-1.el6.x86_64                                    8/8 

    Installed:
      puppet.noarch 0:2.6.17-2.el6                                                  

    Dependency Installed:
      augeas-libs.x86_64 0:0.9.0-4.el6         facter.x86_64 0:1.6.6-1.el6          
      libselinux-ruby.x86_64 0:2.0.94-5.3.el6  ruby.x86_64 0:1.8.7.352-7.el6_2      
      ruby-augeas.x86_64 0:0.4.1-1.el6         ruby-libs.x86_64 0:1.8.7.352-7.el6_2 
      ruby-shadow.x86_64 0:1.4.1-13.el6       

    Complete!
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# modules/iqirclog/files/usr/local/dvn/sbin/dvn-puppet-apply
    Unknown function create_resources at /root/iqirclog-vagrant/modules/mysql/manifests/server.pp:31 on node dvn-5.hmdc.harvard.edu
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# yum install http://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-6.noarch.rpm
    Loaded plugins: fastestmirror, priorities, protectbase, security, versionlock
    Loading mirror speeds from cached hostfile
     * base: mirror.metrocast.net
     * centos_extras: mirror.metrocast.net
     * epel: mirror.seas.harvard.edu
     * extras: mirror.metrocast.net
     * puias_6_core_base: www.puias.princeton.edu
     * puias_6_unsupported: www.puias.princeton.edu
     * rpmforge: mirror.us.leaseweb.net
     * updates: centos.mirror.constant.com
    8762 packages excluded due to repository priority protections
    0 packages excluded due to repository protections
    Setting up Install Process
    puppetlabs-release-6-6.noarch.rpm                        | 5.6 kB     00:00     
    Examining /var/tmp/yum-root-NuBru6/puppetlabs-release-6-6.noarch.rpm: puppetlabs-release-6-6.noarch
    Marking /var/tmp/yum-root-NuBru6/puppetlabs-release-6-6.noarch.rpm to be installed
    Resolving Dependencies
    --> Running transaction check
    ---> Package puppetlabs-release.noarch 0:6-6 will be installed
    --> Finished Dependency Resolution

    Dependencies Resolved

    ================================================================================
     Package               Arch      Version
                                            Repository                         Size
    ================================================================================
    Installing:
     puppetlabs-release    noarch    6-6    /puppetlabs-release-6-6.noarch    2.9 k

    Transaction Summary
    ================================================================================
    Install       1 Package(s)

    Total size: 2.9 k
    Installed size: 2.9 k
    Is this ok [y/N]: y
    Downloading Packages:
    Running rpm_check_debug
    Running Transaction Test
    Transaction Test Succeeded
    Running Transaction
      Installing : puppetlabs-release-6-6.noarch                                1/1 
      Verifying  : puppetlabs-release-6-6.noarch                                1/1 

    Installed:
      puppetlabs-release.noarch 0:6-6                                               

    Complete!
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# yum update puppet
    Loaded plugins: fastestmirror, priorities, protectbase, security, versionlock
    Loading mirror speeds from cached hostfile
     * base: mirror.metrocast.net
     * centos_extras: mirror.metrocast.net
     * epel: mirror.seas.harvard.edu
     * extras: mirror.metrocast.net
     * puias_6_core_base: www.puias.princeton.edu
     * puias_6_unsupported: www.puias.princeton.edu
     * rpmforge: mirror.us.leaseweb.net
     * updates: centos.mirror.constant.com
    puppetlabs-deps                                          | 1.9 kB     00:00     
    puppetlabs-deps/primary_db                               |  14 kB     00:00     
    puppetlabs-products                                      | 1.9 kB     00:00     
    puppetlabs-products/primary_db                           |  60 kB     00:00     
    8886 packages excluded due to repository priority protections
    0 packages excluded due to repository protections
    Setting up Update Process
    No Packages marked for Update
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# cp -a /etc/yum.repos.d/puppetlabs.repo /etc/yum.repos.d/puppetlabs.repo.orig
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# vim /etc/yum.repos.d/puppetlabs.repo
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# diff /etc/yum.repos.d/puppetlabs.repo.orig /etc/yum.repos.d/puppetlabs.repo
    6a7
    > priority=1
    13a15
    > priority=1
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# yum update puppetLoaded plugins: fastestmirror, priorities, protectbase, security, versionlock
    Loading mirror speeds from cached hostfile
     * base: mirror.metrocast.net
     * centos_extras: mirror.metrocast.net
     * epel: mirror.seas.harvard.edu
     * extras: mirror.metrocast.net
     * puias_6_core_base: www.puias.princeton.edu
     * puias_6_unsupported: www.puias.princeton.edu
     * rpmforge: mirror.us.leaseweb.net
     * updates: centos.mirror.constant.com
    puppetlabs-deps                                          | 1.9 kB     00:00     
    puppetlabs-products                                      | 1.9 kB     00:00     
    8786 packages excluded due to repository priority protections
    0 packages excluded due to repository protections
    Setting up Update Process
    Resolving Dependencies
    --> Running transaction check
    ---> Package puppet.noarch 0:2.6.17-2.el6 will be updated
    ---> Package puppet.noarch 0:3.0.1-1.el6 will be an update
    --> Processing Dependency: facter >= 1.6.11 for package: puppet-3.0.1-1.el6.noarch
    --> Processing Dependency: hiera >= 1.0.0 for package: puppet-3.0.1-1.el6.noarch
    --> Running transaction check
    ---> Package facter.x86_64 0:1.6.6-1.el6 will be updated
    ---> Package facter.x86_64 1:1.6.16-1.el6 will be an update
    ---> Package hiera.noarch 0:1.1.1-1.el6 will be installed
    --> Processing Dependency: rubygem-json for package: hiera-1.1.1-1.el6.noarch
    --> Running transaction check
    ---> Package rubygem-json.x86_64 0:1.4.6-2.el6 will be installed
    --> Processing Dependency: rubygems for package: rubygem-json-1.4.6-2.el6.x86_64
    --> Running transaction check
    ---> Package rubygems.noarch 0:1.3.7-1.el6 will be installed
    --> Processing Dependency: ruby-rdoc for package: rubygems-1.3.7-1.el6.noarch
    --> Running transaction check
    ---> Package ruby-rdoc.x86_64 0:1.8.7.352-7.el6_2 will be installed
    --> Processing Dependency: ruby-irb = 1.8.7.352-7.el6_2 for package: ruby-rdoc-1.8.7.352-7.el6_2.x86_64
    --> Running transaction check
    ---> Package ruby-irb.x86_64 0:1.8.7.352-7.el6_2 will be installed
    --> Finished Dependency Resolution

    Dependencies Resolved

    ================================================================================
     Package         Arch      Version                 Repository              Size
    ================================================================================
    Updating:
     puppet          noarch    3.0.1-1.el6             puppetlabs-products    890 k
    Installing for dependencies:
     hiera           noarch    1.1.1-1.el6             puppetlabs-products     19 k
     ruby-irb        x86_64    1.8.7.352-7.el6_2       base                   311 k
     ruby-rdoc       x86_64    1.8.7.352-7.el6_2       base                   375 k
     rubygem-json    x86_64    1.4.6-2.el6             puppetlabs-deps        457 k
     rubygems        noarch    1.3.7-1.el6             base                   206 k
    Updating for dependencies:
     facter          x86_64    1:1.6.16-1.el6          puppetlabs-products     59 k

    Transaction Summary
    ================================================================================
    Install       5 Package(s)
    Upgrade       2 Package(s)

    Total download size: 2.3 M
    Is this ok [y/N]: y
    Downloading Packages:
    (1/7): facter-1.6.16-1.el6.x86_64.rpm                    |  59 kB     00:00     
    (2/7): hiera-1.1.1-1.el6.noarch.rpm                      |  19 kB     00:00     
    (3/7): puppet-3.0.1-1.el6.noarch.rpm                     | 890 kB     00:00     
    (4/7): ruby-irb-1.8.7.352-7.el6_2.x86_64.rpm             | 311 kB     00:00     
    (5/7): ruby-rdoc-1.8.7.352-7.el6_2.x86_64.rpm            | 375 kB     00:00     
    (6/7): rubygem-json-1.4.6-2.el6.x86_64.rpm               | 457 kB     00:00     
    (7/7): rubygems-1.3.7-1.el6.noarch.rpm                   | 206 kB     00:00     
    --------------------------------------------------------------------------------
    Total                                           2.1 MB/s | 2.3 MB     00:01     
    warning: rpmts_HdrFromFdno: Header V4 RSA/SHA1 Signature, key ID 4bd6ec30: NOKEY
    Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs
    Importing GPG key 0x4BD6EC30:
     Userid : Puppet Labs Release Key (Puppet Labs Release Key) <info@puppetlabs.com>
     Package: puppetlabs-release-6-6.noarch (@/puppetlabs-release-6-6.noarch)
     From   : /etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs
    Is this ok [y/N]: y
    Running rpm_check_debug
    Running Transaction Test
    Transaction Test Succeeded
    Running Transaction
      Installing : ruby-irb-1.8.7.352-7.el6_2.x86_64                            1/9 
      Installing : ruby-rdoc-1.8.7.352-7.el6_2.x86_64                           2/9 
      Installing : rubygems-1.3.7-1.el6.noarch                                  3/9 
      Installing : rubygem-json-1.4.6-2.el6.x86_64                              4/9 
      Installing : hiera-1.1.1-1.el6.noarch                                     5/9 
      Updating   : 1:facter-1.6.16-1.el6.x86_64                                 6/9 
      Updating   : puppet-3.0.1-1.el6.noarch                                    7/9 
      Cleanup    : puppet-2.6.17-2.el6.noarch                                   8/9 
      Cleanup    : facter-1.6.6-1.el6.x86_64                                    9/9 
      Verifying  : 1:facter-1.6.16-1.el6.x86_64                                 1/9 
      Verifying  : hiera-1.1.1-1.el6.noarch                                     2/9 
      Verifying  : ruby-irb-1.8.7.352-7.el6_2.x86_64                            3/9 
      Verifying  : ruby-rdoc-1.8.7.352-7.el6_2.x86_64                           4/9 
      Verifying  : rubygem-json-1.4.6-2.el6.x86_64                              5/9 
      Verifying  : rubygems-1.3.7-1.el6.noarch                                  6/9 
      Verifying  : puppet-3.0.1-1.el6.noarch                                    7/9 
      Verifying  : facter-1.6.6-1.el6.x86_64                                    8/9 
      Verifying  : puppet-2.6.17-2.el6.noarch                                   9/9 

    Dependency Installed:
      hiera.noarch 0:1.1.1-1.el6              ruby-irb.x86_64 0:1.8.7.352-7.el6_2   
      ruby-rdoc.x86_64 0:1.8.7.352-7.el6_2    rubygem-json.x86_64 0:1.4.6-2.el6     
      rubygems.noarch 0:1.3.7-1.el6          

    Updated:
      puppet.noarch 0:3.0.1-1.el6                                                   

    Dependency Updated:
      facter.x86_64 1:1.6.16-1.el6                                                  

    Complete!
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# modules/iqirclog/files/usr/local/dvn/sbin/dvn-puppet-apply
    Warning: Config file /etc/puppet/hiera.yaml not found, using Hiera defaults
    /File[/etc/yum.repos.d/greptilian.repo]/ensure: defined content as '{md5}01cfa411cc38c665525ee4a983e176ab'
    /Stage[packages]/Packages/Package[perl-Text-Table]/ensure: created
    Error: Execution of '/usr/bin/yum -d 0 -e 0 -y install perl-Bot-BasicBot' returned 1: Error: Package: perl-POE-Component-IRC-6.80-1.el6.noarch (greptilian)
               Requires: perl(POE) >= 1.311
               Installing: perl-POE-1.289-3.el6.noarch (epel)
                   perl(POE) = 1.289
     You could try using --skip-broken to work around the problem
     You could try running: rpm -Va --nofiles --nodigest

    Error: /Stage[packages]/Packages/Package[perl-Bot-BasicBot]/ensure: change from absent to present failed: Execution of '/usr/bin/yum -d 0 -e 0 -y install perl-Bot-BasicBot' returned 1: Error: Package: perl-POE-Component-IRC-6.80-1.el6.noarch (greptilian)
               Requires: perl(POE) >= 1.311
               Installing: perl-POE-1.289-3.el6.noarch (epel)
                   perl(POE) = 1.289
     You could try using --skip-broken to work around the problem
     You could try running: rpm -Va --nofiles --nodigest

    Error: Execution of '/usr/bin/yum -d 0 -e 0 -y install perl-POE-Component-Syndicator' returned 1: Error: Package: perl-POE-Component-Syndicator-0.06-4.el6.noarch (greptilian)
               Requires: perl(POE) >= 1.311
               Available: perl-POE-1.289-3.el6.noarch (epel)
                   perl(POE) = 1.289
     You could try using --skip-broken to work around the problem
     You could try running: rpm -Va --nofiles --nodigest

    Error: /Stage[packages]/Packages/Package[perl-POE-Component-Syndicator]/ensure: change from absent to present failed: Execution of '/usr/bin/yum -d 0 -e 0 -y install perl-POE-Component-Syndicator' returned 1: Error: Package: perl-POE-Component-Syndicator-0.06-4.el6.noarch (greptilian)
               Requires: perl(POE) >= 1.311
               Available: perl-POE-1.289-3.el6.noarch (epel)
                   perl(POE) = 1.289
     You could try using --skip-broken to work around the problem
     You could try running: rpm -Va --nofiles --nodigest

    /Stage[packages]/Packages/Package[screen]/ensure: created
    /Stage[packages]/Packages/Package[perl-Config-File]/ensure: created
    /Stage[packages]/Packages/Package[perl-libwww-perl]/ensure: created
    /Stage[packages]/Packages/Package[ack]/ensure: created
    /Stage[packages]/Packages/Package[perl-Calendar-Simple]/ensure: created
    /Stage[packages]/Packages/Package[perl-Cache-Cache]/ensure: created
    /Stage[packages]/Packages/Package[perl-File-Slurp]/ensure: created
    /Stage[packages]/Packages/Package[perl-Regexp-Common]/ensure: created
    /Stage[packages]/Packages/Package[perl-CGI]/ensure: created
    /Stage[packages]/Packages/Package[httpd]/ensure: created
    /Stage[packages]/Packages/Package[perl-Date-Simple]/ensure: created
    /Stage[packages]/Packages/Package[perl-HTML-Template]/ensure: created
    /Stage[users]/Users/User[iqlogbot]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /Stage[users]/Users/User[iqlogbot]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /Stage[users]/Users/User[iqlogbot]: Skipping because of failed dependencies
    /File[/home/iqlogbot]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/home/iqlogbot]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/home/iqlogbot]: Skipping because of failed dependencies
    /Stage[main]/Mysql::Server/Package[mysql-server]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /Stage[main]/Mysql::Server/Package[mysql-server]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /Stage[main]/Mysql::Server/Package[mysql-server]: Skipping because of failed dependencies
    /Stage[main]/Mysql::Server/Service[mysqld]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /Stage[main]/Mysql::Server/Service[mysqld]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /Stage[main]/Mysql::Server/Service[mysqld]: Skipping because of failed dependencies
    /File[/usr/local/dvn]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/usr/local/dvn]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/usr/local/dvn]: Skipping because of failed dependencies
    /File[/usr/local/dvn/bin]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/usr/local/dvn/bin]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/usr/local/dvn/bin]: Skipping because of failed dependencies
    /File[/etc/httpd/conf.d/irclog.iq.harvard.edu.conf]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/etc/httpd/conf.d/irclog.iq.harvard.edu.conf]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/etc/httpd/conf.d/irclog.iq.harvard.edu.conf]: Skipping because of failed dependencies
    /File[/usr/local/dvn/sbin]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/usr/local/dvn/sbin]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/usr/local/dvn/sbin]: Skipping because of failed dependencies
    /File[/usr/local/dvn/sbin/dvn-puppet-apply]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/usr/local/dvn/sbin/dvn-puppet-apply]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/usr/local/dvn/sbin/dvn-puppet-apply]: Skipping because of failed dependencies
    /File[/usr/local/dvn/bin/iqlogbot]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/usr/local/dvn/bin/iqlogbot]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/usr/local/dvn/bin/iqlogbot]: Skipping because of failed dependencies
    /File[/var/www/irclog]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/var/www/irclog]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/var/www/irclog]: Skipping because of failed dependencies
    /File[/var/www/irclog/ilbot]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/var/www/irclog/ilbot]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/var/www/irclog/ilbot]: Skipping because of failed dependencies
    /File[/var/www/irclog/ilbot/database.conf]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/var/www/irclog/ilbot/database.conf]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/var/www/irclog/ilbot/database.conf]: Skipping because of failed dependencies
    /File[/var/www/irclog/ilbot/bot.conf]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/var/www/irclog/ilbot/bot.conf]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/var/www/irclog/ilbot/bot.conf]: Skipping because of failed dependencies
    /File[/var/www/irclog/ilbot/cgi]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/var/www/irclog/ilbot/cgi]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/var/www/irclog/ilbot/cgi]: Skipping because of failed dependencies
    /File[/var/www/irclog/ilbot/cgi/template]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/var/www/irclog/ilbot/cgi/template]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/var/www/irclog/ilbot/cgi/template]: Skipping because of failed dependencies
    /File[/var/www/irclog/ilbot/cgi/template/linkblock.tmpl]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/var/www/irclog/ilbot/cgi/template/linkblock.tmpl]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/var/www/irclog/ilbot/cgi/template/linkblock.tmpl]: Skipping because of failed dependencies
    /File[/var/www/irclog/ilbot/cgi/template/day.tmpl]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/var/www/irclog/ilbot/cgi/template/day.tmpl]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/var/www/irclog/ilbot/cgi/template/day.tmpl]: Skipping because of failed dependencies
    /File[/var/www/irclog/ilbot/cgi/channels]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/var/www/irclog/ilbot/cgi/channels]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/var/www/irclog/ilbot/cgi/channels]: Skipping because of failed dependencies
    /File[/var/www/irclog/ilbot/cgi/iqss-logo.png]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/var/www/irclog/ilbot/cgi/iqss-logo.png]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/var/www/irclog/ilbot/cgi/iqss-logo.png]: Skipping because of failed dependencies
    /File[/var/www/irclog/ilbot/cgi/moose1.ico]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/var/www/irclog/ilbot/cgi/moose1.ico]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/var/www/irclog/ilbot/cgi/moose1.ico]: Skipping because of failed dependencies
    /File[/var/www/irclog/ilbot/cgi/database.conf]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/var/www/irclog/ilbot/cgi/database.conf]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/var/www/irclog/ilbot/cgi/database.conf]: Skipping because of failed dependencies
    /Stage[main]/Iqirclog/Mysql::Db[iqirclog]/Database[iqirclog]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /Stage[main]/Iqirclog/Mysql::Db[iqirclog]/Database[iqirclog]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /Stage[main]/Iqirclog/Mysql::Db[iqirclog]/Database[iqirclog]: Skipping because of failed dependencies
    /Stage[main]/Iqirclog/Mysql::Db[iqirclog]/Database_user[iqirclog@localhost]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /Stage[main]/Iqirclog/Mysql::Db[iqirclog]/Database_user[iqirclog@localhost]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /Stage[main]/Iqirclog/Mysql::Db[iqirclog]/Database_user[iqirclog@localhost]: Skipping because of failed dependencies
    /File[/usr/share/perl5/vendor_perl/IrcLog]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/usr/share/perl5/vendor_perl/IrcLog]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/usr/share/perl5/vendor_perl/IrcLog]: Skipping because of failed dependencies
    /File[/usr/share/perl5/vendor_perl/IrcLog/WWW.pm]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/usr/share/perl5/vendor_perl/IrcLog/WWW.pm]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/usr/share/perl5/vendor_perl/IrcLog/WWW.pm]: Skipping because of failed dependencies
    Error: Could not prefetch database_grant provider 'mysql': Execution of '/usr/bin/mysql --defaults-file=/root/.my.cnf mysql -Be describe user' returned 1: Could not open required defaults file: /root/.my.cnf
    Fatal error in defaults handling. Program aborted
    ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/lib/mysql/mysql.sock' (2)

    /Stage[main]/Iqirclog/Mysql::Db[iqirclog]/Database_grant[iqirclog@localhost/iqirclog]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /Stage[main]/Iqirclog/Mysql::Db[iqirclog]/Database_grant[iqirclog@localhost/iqirclog]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /Stage[main]/Iqirclog/Mysql::Db[iqirclog]/Database_grant[iqirclog@localhost/iqirclog]: Skipping because of failed dependencies
    /File[/var/www/irclog/ilbot/cgi/channels/dvn.tmpl]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/var/www/irclog/ilbot/cgi/channels/dvn.tmpl]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/var/www/irclog/ilbot/cgi/channels/dvn.tmpl]: Skipping because of failed dependencies
    /File[/var/www/data]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/var/www/data]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/var/www/data]: Skipping because of failed dependencies
    /File[/usr/local/dvn/sbin/iqlogbot-setup]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/usr/local/dvn/sbin/iqlogbot-setup]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/usr/local/dvn/sbin/iqlogbot-setup]: Skipping because of failed dependencies
    /File[/etc/mysql]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/etc/mysql]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/etc/mysql]: Skipping because of failed dependencies
    /File[/etc/my.cnf]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/etc/my.cnf]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/etc/my.cnf]: Skipping because of failed dependencies
    /File[/etc/mysql/conf.d]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/etc/mysql/conf.d]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/etc/mysql/conf.d]: Skipping because of failed dependencies
    /Stage[main]/Mysql::Config/Exec[set_mysql_rootpw]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /Stage[main]/Mysql::Config/Exec[set_mysql_rootpw]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /Stage[main]/Mysql::Config/Exec[set_mysql_rootpw]: Skipping because of failed dependencies
    /File[/root/.my.cnf]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/root/.my.cnf]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/root/.my.cnf]: Skipping because of failed dependencies
    /Stage[main]/Mysql::Config/Exec[mysqld-restart]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /Stage[main]/Mysql::Config/Exec[mysqld-restart]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /Stage[main]/Mysql::Config/Exec[mysqld-restart]: Skipping because of failed dependencies
    /File[/usr/share/perl5/vendor_perl/IrcLog.pm]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/usr/share/perl5/vendor_perl/IrcLog.pm]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/usr/share/perl5/vendor_perl/IrcLog.pm]: Skipping because of failed dependencies
    /File[/var/www/irclog/ilbot/iqirclog.sql]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[/var/www/irclog/ilbot/iqirclog.sql]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[/var/www/irclog/ilbot/iqirclog.sql]: Skipping because of failed dependencies
    /File[mysqlbackupdir]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[mysqlbackupdir]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[mysqlbackupdir]: Skipping because of failed dependencies
    /File[mysqlbackup.sh]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /File[mysqlbackup.sh]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /File[mysqlbackup.sh]: Skipping because of failed dependencies
    /Stage[main]/Mysql::Backup/Cron[mysql-backup]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /Stage[main]/Mysql::Backup/Cron[mysql-backup]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /Stage[main]/Mysql::Backup/Cron[mysql-backup]: Skipping because of failed dependencies
    /Stage[main]/Mysql::Backup/Database_user[iqmysqldump@localhost]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /Stage[main]/Mysql::Backup/Database_user[iqmysqldump@localhost]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /Stage[main]/Mysql::Backup/Database_user[iqmysqldump@localhost]: Skipping because of failed dependencies
    /Stage[main]/Mysql::Backup/Database_grant[iqmysqldump@localhost]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    /Stage[main]/Mysql::Backup/Database_grant[iqmysqldump@localhost]: Dependency Package[perl-Bot-BasicBot] has failures: true
    Warning: /Stage[main]/Mysql::Backup/Database_grant[iqmysqldump@localhost]: Skipping because of failed dependencies
    /Stage[last]/Last/Exec[open perms on mysql backups]: Dependency Package[perl-Bot-BasicBot] has failures: true
    /Stage[last]/Last/Exec[open perms on mysql backups]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    Warning: /Stage[last]/Last/Exec[open perms on mysql backups]: Skipping because of failed dependencies
    /Stage[last]/Last/Service[httpd]: Dependency Package[perl-Bot-BasicBot] has failures: true
    /Stage[last]/Last/Service[httpd]: Dependency Package[perl-POE-Component-Syndicator] has failures: true
    Warning: /Stage[last]/Last/Service[httpd]: Skipping because of failed dependencies
    Finished catalog run in 129.17 seconds
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# git pull
    remote: Counting objects: 15, done.
    remote: Compressing objects: 100% (4/4), done.
    remote: Total 8 (delta 3), reused 8 (delta 3)
    Unpacking objects: 100% (8/8), done.
    From https://github.com/dvn/iqirclog-vagrant
       ae4dbb3..c62252e  master     -> origin/master
    Updating ae4dbb3..c62252e
    Fast-forward
     .../iqirclog/files/etc/yum.repos.d/greptilian.repo |    1 +
     1 files changed, 1 insertions(+), 0 deletions(-)
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# git diff HEAD^ HEAD
    diff --git a/modules/iqirclog/files/etc/yum.repos.d/greptilian.repo b/modules/iq
    index 8134abc..e761401 100644
    --- a/modules/iqirclog/files/etc/yum.repos.d/greptilian.repo
    +++ b/modules/iqirclog/files/etc/yum.repos.d/greptilian.repo
    @@ -3,3 +3,4 @@ name=greptilian
     baseurl=http://yum.greptilian.com
     gpgcheck=0
     enabled=1
    +priority=1
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# modules/iqirclog/files/usr/local/dvn/sbin/dvn-puppet-apply
    Warning: Config file /etc/puppet/hiera.yaml not found, using Hiera defaults
    /File[/etc/yum.repos.d/greptilian.repo]/content: content changed '{md5}01cfa411cc38c665525ee4a983e176ab' to '{md5}3642979b262a3f8ea96ae9705af68d46'
    /Stage[packages]/Packages/Package[perl-Bot-BasicBot]/ensure: created
    /Stage[packages]/Packages/Package[perl-POE-Component-Syndicator]/ensure: created
    /Stage[users]/Users/User[iqlogbot]/ensure: created
    /File[/home/iqlogbot]/group: group changed 'iqlogbot' to 'root'
    /File[/home/iqlogbot]/mode: mode changed '0700' to '0755'
    /Stage[main]/Mysql::Server/Package[mysql-server]/ensure: created
    /Stage[main]/Mysql::Server/Service[mysqld]/ensure: ensure changed 'stopped' to 'running'
    /File[/usr/local/dvn]/ensure: created
    /File[/usr/local/dvn/bin]/ensure: created
    /File[/etc/httpd/conf.d/irclog.iq.harvard.edu.conf]/ensure: defined content as '{md5}187f0bb17f6c46b9fd510472e499639f'
    /File[/usr/local/dvn/sbin]/ensure: created
    /File[/usr/local/dvn/sbin/dvn-puppet-apply]/ensure: defined content as '{md5}98782314635142bf34bfacdeb0901656'
    /File[/usr/local/dvn/bin/iqlogbot]/ensure: defined content as '{md5}6e9710493db894e2c32a3756060cb1b8'
    /File[/var/www/irclog]/ensure: created
    /File[/var/www/irclog/ilbot]/ensure: created
    /File[/var/www/irclog/ilbot/database.conf]/ensure: defined content as '{md5}f82c11bc7fc2a5633083cfbe4ecbe47c'
    /File[/var/www/irclog/ilbot/bot.conf]/ensure: defined content as '{md5}276cf288786add83ba75cc8aa64d3942'
    /File[/var/www/irclog/ilbot/cgi]/ensure: created
    /File[/var/www/irclog/ilbot/cgi/template]/ensure: created
    /File[/var/www/irclog/ilbot/cgi/template/linkblock.tmpl]/ensure: defined content as '{md5}898c76eacb547d8184e2231e2fc699b1'
    /File[/var/www/irclog/ilbot/cgi/template/day.tmpl]/ensure: defined content as '{md5}4d83a44f874a168a8756e40580b41e70'
    /File[/var/www/irclog/ilbot/cgi/channels]/ensure: created
    /File[/var/www/irclog/ilbot/cgi/iqss-logo.png]/ensure: defined content as '{md5}8040ce68e56104e3dfdbe175c3e0951f'
    /File[/var/www/irclog/ilbot/cgi/moose1.ico]/ensure: defined content as '{md5}25f2245f99dd2c81576047b8d28a0eaa'
    /File[/var/www/irclog/ilbot/cgi/database.conf]/ensure: defined content as '{md5}f82c11bc7fc2a5633083cfbe4ecbe47c'
    /Stage[main]/Iqirclog/Mysql::Db[iqirclog]/Database[iqirclog]/ensure: created
    Error: Execution of '/usr/bin/mysql --defaults-file=/root/.my.cnf mysql -e SET PASSWORD FOR 'iqirclog'@'localhost' = '*F3A2A51A9B0F2BE2468926B4132313728C250DBF'' returned 1: Could not open required defaults file: /root/.my.cnf
    Fatal error in defaults handling. Program aborted
    ERROR 1133 (42000) at line 1: Can't find any matching row in the user table

    Error: /Stage[main]/Iqirclog/Mysql::Db[iqirclog]/Database_user[iqirclog@localhost]/password_hash: change from Could not open required defaults file: /root/.my.cnf
    Fatal error in defaults handling. Program aborted to *F3A2A51A9B0F2BE2468926B4132313728C250DBF failed: Execution of '/usr/bin/mysql --defaults-file=/root/.my.cnf mysql -e SET PASSWORD FOR 'iqirclog'@'localhost' = '*F3A2A51A9B0F2BE2468926B4132313728C250DBF'' returned 1: Could not open required defaults file: /root/.my.cnf
    Fatal error in defaults handling. Program aborted
    ERROR 1133 (42000) at line 1: Can't find any matching row in the user table

    /File[/usr/share/perl5/vendor_perl/IrcLog]/ensure: created
    /File[/usr/share/perl5/vendor_perl/IrcLog/WWW.pm]/ensure: defined content as '{md5}7acb872bc906ee2413918e242f580aba'
    /Stage[main]/Iqirclog/Mysql::Db[iqirclog]/Database_grant[iqirclog@localhost/iqirclog]: Dependency Database_user[iqirclog@localhost] has failures: true
    Warning: /Stage[main]/Iqirclog/Mysql::Db[iqirclog]/Database_grant[iqirclog@localhost/iqirclog]: Skipping because of failed dependencies
    /File[/var/www/irclog/ilbot/cgi/channels/dvn.tmpl]/ensure: defined content as '{md5}67f0b2475057b9dcaecc45ce841e25c6'
    /File[/var/www/data]/ensure: created
    /File[/usr/local/dvn/sbin/iqlogbot-setup]/ensure: defined content as '{md5}14bf20bca2a079589e405ea7ece488a4'
    /File[/etc/mysql]/ensure: created
    /File[/etc/my.cnf]/content: content changed '{md5}8ace886bbe7e274448bc8bea16d3ead6' to '{md5}5f8b500ae254fff4bf9f7d2a925caf8a'
    /File[/etc/mysql/conf.d]/ensure: created
    /Stage[main]/Mysql::Config/Exec[set_mysql_rootpw]/returns: executed successfully
    /File[/root/.my.cnf]/ensure: defined content as '{md5}ceb4f7ac6eba1f5ffb9631c80ef2b436'
    /Stage[main]/Mysql::Config/Exec[mysqld-restart]: Triggered 'refresh' from 5 events
    /File[/usr/share/perl5/vendor_perl/IrcLog.pm]/ensure: defined content as '{md5}25b35680f64a867fa614544ba528a282'
    /File[/var/www/irclog/ilbot/iqirclog.sql]/ensure: defined content as '{md5}161a0b9a92baa6c84bf641a67afc575d'
    /File[mysqlbackupdir]/ensure: created
    /File[mysqlbackup.sh]/ensure: created
    /Stage[main]/Mysql::Backup/Cron[mysql-backup]/ensure: created
    /Stage[main]/Mysql::Backup/Database_user[iqmysqldump@localhost]/ensure: created
    /Stage[main]/Mysql::Backup/Database_grant[iqmysqldump@localhost]/privileges: privileges changed '' to 'lock_tables_priv, reload_priv, select_priv, show_view_priv'
    /Stage[last]/Last/Exec[open perms on mysql backups]: Dependency Database_user[iqirclog@localhost] has failures: true
    Warning: /Stage[last]/Last/Exec[open perms on mysql backups]: Skipping because of failed dependencies
    /Stage[last]/Last/Service[httpd]: Dependency Database_user[iqirclog@localhost] has failures: true
    Warning: /Stage[last]/Last/Service[httpd]: Skipping because of failed dependencies
    /Stage[last]/Last/Service[httpd]: Triggered 'refresh' from 1 events
    Finished catalog run in 45.95 seconds
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# modules/iqirclog/files/usr/local/dvn/sbin/dvn-puppet-apply
    Warning: Config file /etc/puppet/hiera.yaml not found, using Hiera defaults
    /Stage[main]/Iqirclog/Mysql::Db[iqirclog]/Database_user[iqirclog@localhost]/ensure: created
    /Stage[main]/Iqirclog/Mysql::Db[iqirclog]/Database_grant[iqirclog@localhost/iqirclog]/privileges: privileges changed '' to 'all'
    /Stage[last]/Last/Exec[open perms on mysql backups]/returns: executed successfully
    /Stage[last]/Last/Service[httpd]/ensure: ensure changed 'stopped' to 'running'
    Finished catalog run in 3.95 seconds
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# cp -a /etc/sysconfig/iptables /etc/sysconfig/iptables.orig
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# vim /etc/sysconfig/iptables
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# diff /etc/sysconfig/iptables.orig /etc/sysconfig/iptables
    12a13
    > -A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# service iptables restart
    iptables: Flushing firewall rules:                         [  OK  ]
    iptables: Setting chains to policy ACCEPT: filter          [  OK  ]
    iptables: Unloading modules:                               [  OK  ]
    iptables: Applying firewall rules:                         [  OK  ]
    [root@dvn-5 iqirclog-vagrant]# 
    [root@dvn-5 iqirclog-vagrant]# cd /var/www/irclog
    [root@dvn-5 irclog]# rm -rf ilbot
    [root@dvn-5 irclog]# git clone https://github.com/moritz/ilbot.git
    Initialized empty Git repository in /var/www/irclog/ilbot/.git/
    remote: Counting objects: 1619, done.
    remote: Compressing objects: 100% (630/630), done.
    remote: Total 1619 (delta 1092), reused 1420 (delta 930)
    Receiving objects: 100% (1619/1619), 403.35 KiB, done.
    Resolving deltas: 100% (1092/1092), done.
    [root@dvn-5 irclog]# 
    [root@dvn-5 irclog]# /usr/local/dvn/sbin/dvn-puppet-apply
    Warning: Config file /etc/puppet/hiera.yaml not found, using Hiera defaults
    /File[/var/www/irclog/ilbot]/seluser: seluser changed 'unconfined_u' to 'system_u'
    /File[/var/www/irclog/ilbot/database.conf]/content: content changed '{md5}a9493244413befe8c7f03d607416c675' to '{md5}f82c11bc7fc2a5633083cfbe4ecbe47c'
    /File[/var/www/irclog/ilbot/database.conf]/seluser: seluser changed 'unconfined_u' to 'system_u'
    /File[/var/www/irclog/ilbot/bot.conf]/content: content changed '{md5}9535c960b33cb6ff37ad151073df83a8' to '{md5}276cf288786add83ba75cc8aa64d3942'
    /File[/var/www/irclog/ilbot/bot.conf]/seluser: seluser changed 'unconfined_u' to 'system_u'
    /File[/var/www/irclog/ilbot/cgi]/seluser: seluser changed 'unconfined_u' to 'system_u'
    /File[/var/www/irclog/ilbot/cgi/template]/seluser: seluser changed 'unconfined_u' to 'system_u'
    /File[/var/www/irclog/ilbot/cgi/template/linkblock.tmpl]/content: content changed '{md5}10c389b47f4317cb1f136c2f8be4ae82' to '{md5}898c76eacb547d8184e2231e2fc699b1'
    /File[/var/www/irclog/ilbot/cgi/template/linkblock.tmpl]/seluser: seluser changed 'unconfined_u' to 'system_u'
    /File[/var/www/irclog/ilbot/cgi/template/day.tmpl]/content: content changed '{md5}f6cc41819086f74015768d7699fd5b57' to '{md5}4d83a44f874a168a8756e40580b41e70'
    /File[/var/www/irclog/ilbot/cgi/template/day.tmpl]/seluser: seluser changed 'unconfined_u' to 'system_u'
    /File[/var/www/irclog/ilbot/cgi/channels]/seluser: seluser changed 'unconfined_u' to 'system_u'
    /File[/var/www/irclog/ilbot/cgi/iqss-logo.png]/ensure: defined content as '{md5}8040ce68e56104e3dfdbe175c3e0951f'
    /File[/var/www/irclog/ilbot/cgi/moose1.ico]/content: content changed '{md5}5d887157c45ab8f938342f03a9ae6533' to '{md5}25f2245f99dd2c81576047b8d28a0eaa'
    /File[/var/www/irclog/ilbot/cgi/moose1.ico]/seluser: seluser changed 'unconfined_u' to 'system_u'
    /File[/var/www/irclog/ilbot/cgi/database.conf]/ensure: defined content as '{md5}f82c11bc7fc2a5633083cfbe4ecbe47c'
    /File[/var/www/irclog/ilbot/cgi/channels/dvn.tmpl]/ensure: defined content as '{md5}67f0b2475057b9dcaecc45ce841e25c6'
    /File[/var/www/irclog/ilbot/iqirclog.sql]/ensure: defined content as '{md5}161a0b9a92baa6c84bf641a67afc575d'
    /File[mysqlbackupdir]/mode: mode changed '0755' to '0700'
    /Stage[last]/Last/Exec[open perms on mysql backups]/returns: executed successfully
    Finished catalog run in 4.08 seconds
    [root@dvn-5 irclog]# 
    [root@dvn-5 irclog]# cat ilbot/iqirclog.sql | mysql iqirclog
    [root@dvn-5 irclog]# bash /usr/local/dvn/sbin/iqlogbot-setup 
    [root@dvn-5 irclog]# su - iqlogbot
    [iqlogbot@dvn-5 ~]$ crontab -l
    @reboot screen -d -m bash /usr/local/dvn/bin/iqlogbot
    [iqlogbot@dvn-5 ~]$ screen -d -m bash /usr/local/dvn/bin/iqlogbot
    [iqlogbot@dvn-5 ~]$ 



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
