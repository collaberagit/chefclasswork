class useracct::user {
	$rootgroup = $osfamily ? {
		'Debian' => 'sudo',
		'RedHat' => 'wheel',
	}
	user { 'tom':
		ensure     => present,
		home       => '/home/tom',
		shell  	   => '/bin/bash',
		managehome => true,
		gid	   => 'tom',
		groups	   => "$rootgroup",
	}
}
