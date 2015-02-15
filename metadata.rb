name             'prometheus-chef'
maintainer       'Kristian Järvenpää'
maintainer_email 'kristian.jarvenpaa@gmail.com'
license 		 'MIT'
description      'Installs/Configures prometheus server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'docker'
depends 'build-essential'
