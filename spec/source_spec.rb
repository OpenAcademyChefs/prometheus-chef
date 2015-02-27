require 'spec_helper'


describe 'prometheus-chef::source' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['prometheus']['install_path'] = '/prometheus'
      node.set['prometheus']['config'] = 'testing'
    end.converge(described_recipe)
  end

    it 'includes build-essential' do
      expect(chef_run).to include_recipe('build-essential::default')
    end

    %w[gzip curl gzip mercurial sed vim-common].each do |pkg|
      it 'installs #{pkg}' do
        expect(chef_run).to install_package(pkg)
      end
    end

    it 'creates a directory for prometheus' do
      expect(chef_run).to create_directory('/prometheus')
    end

    it 'syncs prometheus git' do
      expect(chef_run).to sync_git('/prometheus').with(repository: 'https://github.com/prometheus/prometheus.git')
    end

    it 'runs bash command make build in correct directory' do
      expect(chef_run).to run_bash('install_prometheus').with(cwd: '/prometheus')
      expect(chef_run).to run_bash('install_prometheus').with(code: "  make build\n")
    end

    it 'creates configuration file' do
      expect(chef_run).to render_file("/prometheus/prometheus.conf").with_content('testing')
    end

    it 'notfies prometheus to restart' do
      resource = chef_run.template('/prometheus/prometheus.conf')
      expect(resource).to notify('service[prometheus]').to(:restart).delayed
    end

    it 'creates file to init.d' do
      expect(chef_run).to render_file('/etc/init.d/prometheus')
    end

    it 'starts prometheus service' do
      expect(chef_run).to start_service('prometheus')
    end

end
