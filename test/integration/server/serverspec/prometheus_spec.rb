require 'serverspec'

set :backend, :exec

describe "Prometheus Server" do

  it "is running" do
    expect(service('prometheus')).to be_running
  end

  it "is listening on port 9090" do
    expect(port(9090)).to be_listening
  end

end
