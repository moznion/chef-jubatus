name             'jubatus'
maintainer       'moznion'
maintainer_email 'moznion@gmail.com'
license          'MIT'
description      'Installs/Configures jubatus'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

depends 'apt'

%w{ ubuntu debian redhat centos fedora }.each do |os|
  supports os
end
