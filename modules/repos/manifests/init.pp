class repos {

  #include epel

  file { '/etc/yum.repos.d/greptilian.repo' :
    source  => 'puppet:///modules/iqirclog/etc/yum.repos.d/greptilian.repo',
  }

}
