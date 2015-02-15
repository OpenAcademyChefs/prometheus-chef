# Cookbook Name:: prometheus
# Recipe:: source 
#
# Copyright 2015, Kristian Järvenpää
#
# All rights reserved - Do Not Redistribute

execute "apt-get update" do
  action :nothing
end.run_action(:run)

include_recipe 'build-essential::default'

%w[curl git gzip mercurial sed].each do |pkg|
  package pkg
end

directory node['prometheus']['install_path']

git node['prometheus']['install_path'] do
  repository 'https://github.com/prometheus/prometheus.git'
  action :sync
end

bash 'install_prometheus' do
  cwd node['prometheus']['install_path']
  code <<-EOF
  make build
  EOF
end

template "#{node['prometheus']['install_path']}/prometheus.conf" do
  source "prometheus.conf.erb"
  notifies :restart, "service[prometheus]", :delayed
end

template "/etc/init.d/prometheus" do
  source "init.erb"
  variables ({
    :path => "#{node['prometheus']['install_path']}/prometheus",
    :flag => "-config.file=#{node['prometheus']['install_path']}/prometheus.conf" 
  })
  mode '0755'
end

service "prometheus" do
  supports :restart => true
  action :start
end

