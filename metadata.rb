name 'redis-omnibus'
license 'MIT Licence'
description 'Installs Redis with redisio'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.0.0'

maintainer 'Gavin Staniforth'
maintainer_email 'gavin@usemarkup.com'

source_url 'https://github.com/usemarkup/chef-redis'

supports 'centos'

chef_version '>= 12.6' if respond_to?(:chef_version)

depends 'compat_resource'
depends 'ulimit', '>= 0.1.2'
