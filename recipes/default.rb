#
# Cookbook Name:: prometheus-chef
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "prometheus-chef::#{node['prometheus']['install_type']}"

