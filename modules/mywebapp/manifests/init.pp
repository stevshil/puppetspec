# mywebapp

class mywebapp (
  $user               = 'nginx',
  $error_log          = '/var/log/nginx/error.log',
  $worker_connections = 1024,
  $access_log         = '/var/log/nginx/access.log',
  $port               = 80,
  $server_name        = '_',
  $root               = '/var/www/html',
  $cgi_index          = 'index.php'
) {

  # Ensure RPMFusion is installed
  exec{'Adding RPMFusion repos':
    command => '/bin/yum -y install https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-7.noarch.rpm',
    unless  => '/bin/ls /etc/yum.repos.d/rpmfusion*'
  }

  package{['nginx','php-fpm']:
    ensure  => present,
    require => Exec['Adding RPMFusion repos']
  }

  file{'/etc/nginx/nginx.conf':
    ensure  => 'file',
    mode    => '0644',
    owner   => $user,
    group   => $user,
    content => template("${module_name}/nginx.conf.erb"),
    require => Package['nginx'],
    notify  => Service['nginx']
  }

  file{'/etc/nginx/conf.d':
    ensure  => directory,
    require => Package['nginx']
  }

  file{'/etc/nginx/conf.d/default.conf':
    ensure  => file,
    mode    => '0644',
    owner   => $user,
    group   => $user,
    content => template("${module_name}/conf.d/default.conf.erb"),
    require => File['/etc/nginx/conf.d'],
    notify  => Service['nginx']
  }

  exec { "/usr/bin/mkdir -p ${root}":
    unless => "/usr/bin/test -d ${root}"
  }

  file{"${root}/index.php":
    ensure  => file,
    mode    => '0644',
    owner   => $user,
    group   => $user,
    content => "<?php\nphpinfo()\n?>",
    require => Exec["/usr/bin/mkdir -p ${root}"]
  }

  service{'nginx':
    ensure => running,
    enable => true
  }

  service{'php-fpm':
    ensure => running,
    enable => true
  }

}
