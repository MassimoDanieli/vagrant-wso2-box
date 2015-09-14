class esb{
  file { '/tmp/wso2esb-4.9.0.zip':
    source => '/home/vagrant/wso2esb-4.9.9.zip',
  }

  file { '/opt/wso2esb-4.9.0':
    ensure => directory,
    owner  => 'vagrant',
    group  => 'vagrant',
    mode   => 0644,
  }

  exec { 'Extract WSO2 Data Services Server':
    command => '/usr/bin/unzip /tmp/wso2esb-4.9.0.zip',
    cwd     => '/opt',
    creates => '/opt/wso2esb-4.9.0/bin/wso2server.sh',
    user    => 'vagrant',
    group   => 'vagrant',
    require => File['/tmp/wso2esb-4.9.0.zip', '/opt/wso2esb-4.9.0'],
    timeout => 0,
  }

  file { '/etc/init.d/wso2esb':
    owner  => root,
    group  => root,
    mode   => 755,
    source => '/vagrant/provision/esb/puppet/modules/esb/files/wso2esb',
  }

file { [ "/opt/wso2esb-4.9.0/repository", "/opt/wso2esb-4.9.0/repository/components", "/opt/wso2esb-4.9.0/repository/components/lib" ]:
   ensure => directory,
   owner    => 'vagrant',
   group   => 'vagrant',
   before => File ['/opt/wso2esb-4.9.0/repository/components/lib/mysql-connector-java-5.1.36.jar'],
}

  file { '/opt/wso2esb-4.9.0/repository/components/lib/mysql-connector-java-5.1.36.jar':
    owner  => root,
    group  => root,
    mode   => 755,
    source => '/home/vagrant/mysql-connector-java-5.1.36.jar',
  }

  service { 'wso2esb':
    ensure => true,
    enable => true
  }
}
