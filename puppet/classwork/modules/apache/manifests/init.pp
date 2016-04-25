class apache {
	#$http_port = '8080'	
	package { 'httpd':
		ensure   => installed,
	}
	service { 'httpd':
		ensure   => running,
		enable   => true,
		require  => Package['httpd'],
	}
	file { '/etc/httpd/conf/httpd.conf':
		content  => template('apache/httpd.conf.erb'),
		notify   => Service['httpd'],
	}
	file { '/var/www/html/index.html':
		source => 'puppet:///modules/apache/index.html',
	}
}
