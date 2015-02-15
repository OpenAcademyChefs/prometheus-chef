# 
# Cookbook Name:: prometheus-chef
# Attribute:: default


default['docker']['image_cmd_timeout'] = 600


default['prometheus']['install_type'] = 'source'
default['prometheus']['port'] = '9090:9090'
default['prometheus']['install_path'] = "#{Chef::Config[:file_cache_path]}/prometheus"

default['prometheus']['scrape_interval'] = "10s"
default['prometheus']['evaluation_interval'] = "10s"

default['prometheus']['labels'] = [['service','api-test']]
default['prometheus']['rulefiles'] = []

default['prometheus']['jobs'] = [
  {'name' => 'prometheus', 'scrape_interval' => '5s', 'scrape_timeout' => false,
   'sd_name' => false, 'sd_refresh_interval' => false, 'metrics_path' => false,
   'target_group' => ["http://localhost:9090/metrics"]} 

]
