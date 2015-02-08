#
# Cookbook Name:: prometheus
# Recipe:: docker
#

include_recipe 'docker'

docker_image 'prom/prometheus' 

docker_container 'prom/prometheus' do
  detach true
  port '9090:9090'
  env '-p'
end
