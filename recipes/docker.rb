#
# Cookbook Name:: prometheus
# Recipe:: docker
#

include_recipe 'docker'

docker_image 'prom/prometheus' 

template node['prometheus']['config_path'] do
  source "prometheus.conf.erb"
end

docker_container 'prom/prometheus' do
  detach true
  port node['prometheus']['port']
  env '-p -v'
  volume "#{node['prometheus']['config_path']}:/prometheus.conf"
end
