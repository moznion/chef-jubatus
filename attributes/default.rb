
case platform_family
when "rhel"
  default['jubatus']['pkg_manager']     = "#{Chef::Config[:file_cache_path]}/jubatus.rpm"
  default['jubatus']['pkg_manager_src'] = 'http://download.jubat.us/yum/rhel/6/stable/x86_64/jubatus-release-6-1.el6.x86_64.rpm'
  default['jubatus']['packages']        = ['jubatus', 'jubatus-client']
when "debian"
  default['jubatus']['repository']['url']        = 'http://download.jubat.us/apt'
  default['jubatus']['repository']['components'] = ['binary/']
  default['jubatus']['environment_file']         = 'profile'
  default['jubatus']['profile']                  = '/etc/profile'
  default['jubatus']['packages']                 = ['jubatus']
when "mac_os_x"
  # TODO
end
