class packages {

  $server1_packages = [
    'httpd',
    'cronie',
    'git',
    'screen',
    'perl-CGI',
    'perl-Config-File',
    'perl-HTML-Template',
    'perl-libwww-perl',
    'perl-Regexp-Common',
    'perl-Cache-Cache',
    'perl-Bot-BasicBot',
    'perl-POE-Component-Syndicator',
    'perl-Text-Table',
    'perl-Date-Simple',
    'perl-File-Slurp',
    'perl-Calendar-Simple',
    # not required
    'ack',
  ]

  package { $server1_packages:
    ensure => installed,
  }

}
