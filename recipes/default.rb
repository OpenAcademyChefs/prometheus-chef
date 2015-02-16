# 
# Cookbook Name:: prometheus-chef
# Recipe:: default
#
# Copyright 2015, Kristian Järvenpää


node.override['prometheus']['install_type'] = 'docker'

node.override['prometheus']['config'] = "
global: {
  scrape_interval: '15s'     
}

job: {
  
  name: 'prometheus'
  scrape_interval: '5s'

  target_group: {
    target: 'http://localhost:9090/metrics'
  }
}
"


include_recipe "prometheus-chef::#{node['prometheus']['install_type']}"

