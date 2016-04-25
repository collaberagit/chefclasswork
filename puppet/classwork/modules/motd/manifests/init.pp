class motd {
	file { 'motd':
		path => '/etc/motd',
		content => "Welcome to the system",
	}
}
