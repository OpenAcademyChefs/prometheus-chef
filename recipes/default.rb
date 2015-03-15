# 
# Cookbook Name:: prometheus-chef
# Recipe:: default
#
# Copyright 2015, Kristian Järvenpää


include_recipe "prometheus-chef::#{node['prometheus']['install_type']}"

