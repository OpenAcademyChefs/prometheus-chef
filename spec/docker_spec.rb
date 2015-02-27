require 'spec_helper'

describe 'prometheus-chef::docker' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['prometheus']['config_path'] = "/prometheus.conf"
      node.set['prometheus']['config'] = 'testing'
    end.converge(described_recipe)
  end


  it 'includes docker default recipe' do
    expect(chef_run).to include_recipe('docker')
  end

  # it 'creates configuration file' do
  #   expect(chef_run).to render_file("/prometheus.conf")
  # end

  # it 'notfies docker container to restart' do
  #   resource = chef_run.template('/prometheus.conf')
  #   expect(resource).to notify('docker_container[prom/prometheus]').to(:redeply).immediately
  # end

end
