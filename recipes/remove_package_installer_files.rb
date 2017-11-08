# Stop / Remove the default Redis install service
service 'redis' do
  action [:stop, :disable]
  only_if { ::File.exist?('/etc/init.d/redis') }
end

# Delete the Redis package init.d
# Delete sentinel & other configs
%w(/etc/init.d/redis /etc/redis.conf /etc/redis-sentinel.conf /etc/init.d/redis-sentinel).each do |file|
  file file do
    action :delete
    only_if { ::File.exist?(file) }
  end
end

# it seems CentOS default installs creates the user with a shell
# that isnt friendly with this cookbook
user 'redis' do
  shell '/bin/sh'
  action :modify
end
