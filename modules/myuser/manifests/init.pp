class myuser {
	notify{"$fqdn":}

	user {'New admin user':
		name => 'steve',
		home => '/home/steve',
		shell => '/bin/bash',
		groups => ['adm','wheel']
	}

	package{['mariadb','mariadb-server']:
		ensure => present
	}

	package{'httpd':
		ensure => present
	}

	file{'/var/www/html/index.html':
		ensure => file,
		require => Package['httpd'],
		content => template("$module_name/index.html.erb")
	}

	service{'httpd':
		ensure => running,
		enable => true
	}
}
