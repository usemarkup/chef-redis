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
  it 'has memory configured' do
    expect(command('redis-cli info | grep maxmemory_human | grep "maxmemory_human:333.00M"').exit_status).to eq(0)
  end
end

describe '5001 pong' do
  it 'redis is listening on 5001 and ping/pong works' do
    expect(command('redis-cli -p 5001 ping | grep PONG').exit_status).to eq(0)
  end
end

describe '6379 pong' do
  it 'redis is listening on 6379 and ping/pong works' do
    expect(command('redis-cli -p 6379 ping | grep PONG').exit_status).to eq(0)
  end
end
