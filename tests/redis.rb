describe package('redis32u') do
  it { should be_installed }
end

describe service('redis-server') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe 'runtime is available' do
  it 'has redis' do
    expect(command('redis-server -v').exit_status).to eq(0)
  end
end

describe 'redis has 333mb of max memory' do
  it 'has php' do
    expect(command('redis-cli info | grep maxmemory_human | grep "maxmemory_human:333.00M"').exit_status).to eq(0)
  end
end

describe port(6379) do
  it { should be_listening }
  its('processes') { should include 'redis-server' }
end

describe port(5001) do
  it { should be_listening }
  its('processes') { should include 'redis-server' }
end
