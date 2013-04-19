#
# Cookbook Name:: jubatus
# Recipe:: default
#

case node['platform_family']
when "debian"
  include_recipe 'apt'

  apt_repository "jubatus" do
    uri node['jubatus']['repository']['url']
    components node['jubatus']['repository']['components']
    action :add
    notifies :run, "execute[apt-get update]", :immediately
  end

  options = "--force-yes"
when "rhel"
  remote_file node['jubatus']['pkg_manager'] do
    action :create_if_missing
    source node['jubatus']['pkg_manager_src']
  end

  rpm_package node['jubatus']['pkg_manager'] do
    action :install
    source node['jubatus']['pkg_manager']
  end
when "mac_os_x"
  # TODO
  # include_recipe 'homebrew'
end

node['jubatus']['packages'].each do |pkg|
  package pkg do
    action :install
    options options
  end
end

# Add a statement to load environment variables
if node['platform_family'] == 'debian'
  base_dir       = '/opt/jubatus'
  load_statement = "source #{base_dir}/#{node['jubatus']['environment_file']}"

  execute 'Add a statement to load environment variables' do
    command <<-EOC
      grep #{load_statement} #{node['jubatus']['profile']}
      if [ $? -ne 0 ] ; then
        echo "#{load_statement}" >> #{node['jubatus']['profile']}
      fi
    EOC
  end
end
