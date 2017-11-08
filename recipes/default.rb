node.default['redisio']['package_install'] = true

# i.e. the latest Redis 3.2.x
node.default['redisio']['package_name'] = 'redis32u'
node.default['redisio']['version'] = nil
node.default['redisio']['bin_path'] = '/usr/bin/'

# Save once every 15mins
node.default['redisio']['default_settings']['save'] = ['900 1']
node.default['redisio']['default_settings']['maxmemory'] = nil

# This cookbook does not make use of redis-sentinel currently
node.default['redisio']['default_settings']['breadcrumb'] = false

servers = []

node['redis-omnibus']['servers'].each do |name, server_options|
  servers.push(
    Chef::Mixin::DeepMerge.hash_only_merge({ 'name' => "-#{name}" }, server_options)
  )
end

node.default['redisio']['servers'] = servers

include_recipe 'redisio::install'
include_recipe 'redis-omnibus::remove_package_installer_files'
include_recipe 'redisio::configure'
include_recipe 'redisio::enable'
