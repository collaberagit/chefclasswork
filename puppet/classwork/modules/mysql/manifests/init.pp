class mysql {
	package { 'mysql-server':
		ensure => present,
	}

	service { 'mysqld':
		ensure => running,
		enable => true,
	}
}
