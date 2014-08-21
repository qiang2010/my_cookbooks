name             'es_aqueducts'
maintainer       'baidu'
maintainer_email 'jiqiang@baidu.com'
license          'All rights reserved'
description      'Installs/Configures elasticsearch'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.1.2'


recipe "es_aqueducts::default", "install es on node"

recipe "es_aqueducts::start_es", "start es service only if es exists on node"

recipe "es_aqueducts::kill_es", "kill es process"

recipe "es_aqueducts::reload_es", "restart es"

recipe "es_aqueducts::update_es_conf" ,"shutdown es , updata es conf, start es"

recipe "es_aqueducts::remove_es", " remove es from node"

#depends 'java'

supports 'centos'
