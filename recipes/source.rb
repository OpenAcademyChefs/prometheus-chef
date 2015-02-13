#
# Cookbook Name:: prometheus
# Recipe:: source 
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

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

bash 'install_prometheus' do
  cwd "#{Chef::Config[:file_cache_path]}/prometheus"
  code <<-EOF
  make build
  EOF
end

template "#{Chef::Config[:file_cache_path]}/prometheus/prometheus.conf" do
  source "prometheus.conf.erb"
  notifies :restart, "service[prometheus]", :delayed
end

template "/etc/init.d/prometheus" do
  source "init.erb"
  variables ({
    :path => "#{Chef::Config[:file_cache_path]}/prometheus/prometheus",
    :flag => "-config.file=#{Chef::Config[:file_cache_path]}/prometheus/prometheus.conf" 
  })
  mode '0755'
end

service "prometheus" do
  action :start
end

