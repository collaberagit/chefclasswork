#
# Cookbook Name:: splunk
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
group "splunk" do
	action :create
	append true
end

user "svsplunk" do
	system	true
	gid "splunk"
	shell "/bin/bash"
end

directory "/apps/splunk" do
	owner "svsplunk"
	group "splunk"
	mode "0755"
	recursive true
end

remote_file "/apps/splunk/splunkforwarder-6.0.1-189883-linux-2.6-x86_64.rpm" do
	source "http://download.splunk.com/releases/6.0.1/universalforwarder/linux/splunkforwarder-6.0.1-189883-linux-2.6-x86_64.rpm"
	owner "root"
	mode "0755"
end

execute "splunk-install" do
	command "rpm -i --prefix=/apps/splunk /apps/splunk/splunkforwarder-6.0.1-189883-linux-2.6-x86_64.rpm"
	not_if "rpm -qa | grep -i splunkforwarder"
	notifies :run, "execute[splunk-start]", :immediately
end

execute "splunk-start" do	
	command "/apps/splunk/splunkforwarder/bin/splunk start --accept-license"
	action :nothing
end
