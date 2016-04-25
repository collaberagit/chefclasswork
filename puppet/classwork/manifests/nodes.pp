node 'node1.example.com' {
	$http_port = '8090'
	include motd
	include mysql
	include useracct
	include sudo
	include ssh
	include apache
	include ntp
}
node 'node2.example.com' {
	$http_port = '8070'
	include mysql
	include useracct
	include sudo
	include apache
}
node 'node3.example.com'{
	include useracct
	include sudo
	include ntp
}
node default{
	include sudo
}
