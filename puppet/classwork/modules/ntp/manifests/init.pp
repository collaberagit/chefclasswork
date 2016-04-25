class ntp {
	case $operatingsystem {
		centos, redhat: {
			$service_name = 'ntpd'
			$conf_file = 'ntp.conf.el'
			$ntp_servers = ["centos.ntp1.example.com",
					"centos.ntp2.example.com",
					"centos.ntp3.example.com",
                                        "centos.ntp4.example.com",]
		}
		ubuntu, debian: {
			$service_name = 'ntp'
                        $conf_file = 'ntp.conf.debian'
                        $ntp_servers = ["debian.ntp1.example.com iburst",
					"debina.ntp2.example.com iburst",]
		}
	}
	$ntp_servs = $ntp_servers
	package { 'ntp':
		ensure => installed,
	}
	service { 'ntp':
		name      => $service_name,
		ensure    => running,
		enable    => true,
		subscribe => File['ntp.conf'],
	}
	file { 'ntp.conf':
		path      => '/etc/ntp.conf',
		ensure    => file,
		require   => Package['ntp'],
		content   => template("ntp/${conf_file}.erb")
	}
}

