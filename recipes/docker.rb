#
# Cookbook Name:: prometheus
# Recipe:: docker
#

include_recipe 'docker'

docker_image 'prom/prometheus' 

template "/prometheus.conf" do
  source "prometheus.conf.erb"
  notifies :redeploy, 'docker_container[prom/prometheus]', :immediately
end

docker_container 'prom/prometheus' do
  detach true
  port node['prometheus']['port'] 
  env '-p -v'
  volume '/prometheus.conf:/prometheus.conf'
end
