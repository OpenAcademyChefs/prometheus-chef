#
# Cookbook Name:: prometheus
# Recipe:: source 
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

#directory "/home/kristian/cookbooks/cookbooks"

#file "/home/kristian/cookbooks/cookbooks/testfile"

execute "apt-get update" do
  action :nothing
end.run_action(:run)

%w[build-essential curl git gzip mercurial sed].each do |pkg|
  package pkg
end

directory "#{Chef::Config[:file_cache_path]}/prometheus"

git "#{Chef::Config[:file_cache_path]}/prometheus" do
  repository 'https://github.com/prometheus/prometheus.git'
  action :sync
end

template "#{Chef::Config[:file_cache_path]}/prometheus/prometheus.conf" do
  source "prometheus.conf.erb"
end

bash 'install prometheus' do
  cwd "#{Chef::Config[:file_cache_path]}/prometheus"
  code <<-EOF
  make build
  ./prometheus -config.file=prometheus.conf 
  EOF
end
