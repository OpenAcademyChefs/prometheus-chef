# 
# Cookbook Name:: prometheus
# Recipe:: docker
#
# Copyright 2015, Kristian Järvenpää

include_recipe 'docker'

docker_image 'prom/prometheus' 

template "/prometheus.conf" do
  source "prometheus.conf.erb"
end


docker_container 'prom/prometheus' do
  detach true
  port '9090:9090' 
  env '-p -v'
  volume '/prometheus.conf:/prometheus.conf'
end
