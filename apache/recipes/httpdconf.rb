cookbook_file '/etc/httpd/conf/httpd.conf' do
	source 'httpd.conf'
	mode '0755'
end
