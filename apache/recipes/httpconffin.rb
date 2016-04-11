template '/etc/httpd/conf/httpd.conf' do
	source 'httpd.conf.erb'
	mode '0755'
end
