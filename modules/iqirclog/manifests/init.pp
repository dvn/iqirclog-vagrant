class iqirclog {

  file { '/etc/httpd/conf.d/irclog.iq.harvard.edu.conf':
    source => 'puppet:///modules/iqirclog/etc/httpd/conf.d/irclog.iq.harvard.edu.conf',
  }

  file { '/var/www/irclog':
    ensure => directory,
    owner  => 'root',
  }

  file { '/var/www/irclog/ilbot':
    ensure  => directory,
    require => File['/var/www/irclog'],
  }

  file { '/var/www/irclog/ilbot/cgi':
    ensure  => directory,
    require => File['/var/www/irclog/ilbot'],
  }

  file { '/var/www/irclog/ilbot/cgi/template':
    ensure  => directory,
    require => File['/var/www/irclog/ilbot/cgi'],
  }

  file { '/var/www/irclog/ilbot/cgi/channels':
    ensure  => directory,
    require => File['/var/www/irclog/ilbot/cgi'],
  }

  file { '/var/www/irclog/ilbot/iqirclog.sql':
    source  => 'puppet:///modules/iqirclog/var/www/irclog/ilbot/iqirclog.sql',
    require => File['/var/www/irclog/ilbot'],
  }

  file { '/var/www/irclog/ilbot/cgi/database.conf':
    source  => 'puppet:///modules/iqirclog/var/www/irclog/ilbot/cgi/database.conf',
    require => File['/var/www/irclog/ilbot/cgi'],
  }

  file { '/var/www/irclog/ilbot/database.conf':
    source  => 'puppet:///modules/iqirclog/var/www/irclog/ilbot/cgi/database.conf',
    require => File['/var/www/irclog/ilbot'],
  }

  file { '/var/www/irclog/ilbot/bot.conf':
    source  => 'puppet:///modules/iqirclog/var/www/irclog/ilbot/bot.conf',
    require => File['/var/www/irclog/ilbot'],
  }

  file { '/var/www/irclog/ilbot/cgi/template/footer.tmpl':
    source  => 'puppet:///modules/iqirclog/var/www/irclog/ilbot/cgi/template/footer.tmpl',
    require => File['/var/www/irclog/ilbot/cgi/template'],
  }

  file { '/var/www/irclog/ilbot/cgi/template/day.tmpl':
    source  => 'puppet:///modules/iqirclog/var/www/irclog/ilbot/cgi/template/day.tmpl',
    require => File['/var/www/irclog/ilbot/cgi/template'],
  }

  file { '/var/www/irclog/ilbot/cgi/template/linkblock.tmpl':
    source  => 'puppet:///modules/iqirclog/var/www/irclog/ilbot/cgi/template/linkblock.tmpl',
    require => File['/var/www/irclog/ilbot/cgi/template'],
  }

  file { '/var/www/irclog/ilbot/cgi/iqss-logo.png':
    source  => 'puppet:///modules/iqirclog/var/www/irclog/ilbot/cgi/iqss-logo.png',
    require => File['/var/www/irclog/ilbot/cgi'],
  }

  file { '/var/www/irclog/ilbot/cgi/moose1.ico':
    source  => 'puppet:///modules/iqirclog/var/www/irclog/ilbot/cgi/moose1.ico',
    require => File['/var/www/irclog/ilbot/cgi'],
  }

  file { '/var/www/irclog/ilbot/cgi/channels/dvn.tmpl':
    source  => 'puppet:///modules/iqirclog/var/www/irclog/ilbot/cgi/channels/dvn.tmpl',
    require => File['/var/www/irclog/ilbot/cgi/channels'],
  }

  file { '/usr/local/dvn' :
    ensure  => directory,
  }

  file { '/usr/local/dvn/bin' :
    ensure  => directory,
    require => File['/usr/local/dvn'],
  }

  file { '/usr/local/dvn/sbin' :
    ensure  => directory,
    require => File['/usr/local/dvn'],
  }

  file { '/usr/local/dvn/bin/iqlogbot':
    source  => 'puppet:///modules/iqirclog/usr/local/dvn/bin/iqlogbot',
    require => File['/usr/local/dvn/bin'],
    mode    => '0644',
  }

  file { '/usr/local/dvn/sbin/dvn-puppet-apply':
    source  => 'puppet:///modules/iqirclog/usr/local/dvn/sbin/dvn-puppet-apply',
    mode    => '0755',
    require => File['/usr/local/dvn/sbin'],
  }

  file { '/usr/local/dvn/sbin/iqlogbot-setup' :
    source  => 'puppet:///modules/iqirclog/usr/local/dvn/sbin/iqlogbot-setup',
    require => File['/usr/local/dvn/sbin'],
  }

  file { '/usr/share/perl5/vendor_perl/IrcLog.pm' :
    source  => 'puppet:///modules/iqirclog/usr/share/perl5/vendor_perl/IrcLog.pm',
  }

  file { '/usr/share/perl5/vendor_perl/IrcLog' :
    ensure => directory,
  }

  file { '/usr/share/perl5/vendor_perl/IrcLog/WWW.pm' :
    source  => 'puppet:///modules/iqirclog/usr/share/perl5/vendor_perl/IrcLog/WWW.pm',
    require => File['/usr/share/perl5/vendor_perl/IrcLog'],
  }

  class { 'mysql::server':
    config_hash => { 'root_password' => 'foo' }
  }

  mysql::db { 'iqirclog':
    user     => 'iqirclog',
    password => 'foo',
    host     => 'localhost',
    grant    => ['all'],
  }

  class { 'mysql::backup':
    backupuser     => 'iqmysqldump',
    backuppassword => 'foo',
    backupdir      => '/var/www/data/mysql',
    require        => File['/var/www/data'],
  }

  file { '/var/www/data' :
    ensure => directory,
    mode   => '0755',
  }

}
