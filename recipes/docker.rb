# 
# Cookbook Name:: prometheus
# Recipe:: docker
#
# Copyright 2015, Kristian Järvenpää

include_recipe 'docker'

docker_image 'prom/prometheus' 

template node['prometheus']['config_path'] do
  source "prometheus.conf.erb"
  notifies :redeploy, 'docker_container[prom/prometheus]', :immediately
end


docker_container 'prom/prometheus' do
  detach true
  port node['prometheus']['port']
  env '-p -v'
  volume "#{node['prometheus']['config_path']}:/prometheus.conf"
  action :run
end
