class last {

  service { 'httpd':
    ensure    => running,
    enable    => true,
    subscribe => [
      File['/etc/httpd/conf.d/irclog.iq.harvard.edu.conf'],
    ]
  }

  exec { "open perms on mysql backups":
    command => "/bin/chmod 755 /var/www/data/mysql",
  }

}
