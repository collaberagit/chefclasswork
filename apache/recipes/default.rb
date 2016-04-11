#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe	'apache::install'
include_recipe	'apache::service'
include_recipe	'apache::index'
#include_recipe	'apache::httpdconf'
include_recipe	'apache::httpconffin'
