class sudo{
	package { sudo:
		ensure => present,
	}
	if $operatingsystem == 'CentOS' {
		$fname = centsudo
	}
	elsif $operatingsystem == 'Ubuntu' {
		$fname = ubunsudo
	}
	else {
		$fname = sudoers
	}

	file { "/etc/sudoers":
		owner   => 'root',
		group   => 'root',
		mode    => 0440,
		source  => "puppet:///modules/sudo/$fname",
		require => Package["sudo"],
	}
}
