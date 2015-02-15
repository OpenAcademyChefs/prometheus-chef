# 
# Cookbook Name:: prometheus-chef
# Attribute:: default
#
# Copyright 2015, Kristian Järvenpää


default['docker']['image_cmd_timeout'] = 600

default['prometheus']['install_type'] = 'source'
default['prometheus']['port'] = '9090:9090'
default['prometheus']['install_path'] = "#{Chef::Config[:file_cache_path]}/prometheus"

default['prometheus']['config'] = "
global: {
  scrape_interval: '20s'     
  evaluation_interval: '20s' 

   labels: {
    label: {
      name: 'monitor'
      value: 'tutorial-monitor'
    }
  }
}

job: {
  
  name: 'prometheus'
  scrape_interval: '5s'

  target_group: {
    target: 'http://localhost:9090/metrics'
  }
}
"