jubatus Cookbook
================
This is a chef cookbook for [Jubatus](http://jubat.us/)

Requirements
------------

#### platforms
- CentOS, RedHat, Fedora
- Ubuntu, Debian

#### Chef
Version 11.40 or later

#### cookbooks
- [apt](https://github.com/opscode-cookbooks/apt) (if you are using debian family OS.)

Attributes
----------

#### jubatus::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>OS</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['jubatus']['packages']</tt></td>
    <td>Array(String)</td>
    <td>Common</td>
    <td>List of install packages</td>
    <td><tt>['jubatus'](<- Debian), ['jubatus', 'jubatus-client'](<- RHEL)</tt></td>
  </tr>
  <tr>
    <td><tt>['jubatus']['repository']['url']</tt></td>
    <td>String</td>
    <td>Debian</td>
    <td>URL of jubatus apt repository</td>
    <td><tt>http://download.jubat.us/apt</tt></td>
  </tr>
  <tr>
    <td><tt>['jubatus']['repository']['components']</tt></td>
    <td>Array(String)</td>
    <td>Debian</td>
    <td>Contents of repository</td>
    <td><tt>['binary/']</tt></td>
  </tr>
  <tr>
    <td><tt>['jubatus']['environment_file']</tt></td>
    <td>String</td>
    <td>Debian</td>
    <td>Jubatus environment file. If you’re using csh or tcsh
    use this instead:<tt>profile.csh</tt>:</td>
    <td><tt>profile</tt></td>
  </tr>
  <tr>
    <td><tt>['jubatus']['profile']</tt></td>
    <td>String</td>
    <td>Debian</td>
    <td>Profile file to execute 'source jubatus_environment_file'</td>
    <td><tt>/etc/profile</tt></td>
  </tr>
  <tr>
    <td><tt>['jubatus']['pkg_manager_src']</tt></td>
    <td>String</td>
    <td>RHEL</td>
    <td>URL to rpm file of jubatus</td>
    <td><tt>http://download.jubat.us/yum/rhel/6/stable/x86_64/jubatus-release-6-1.el6.x86_64.rpm</tt></td>
  </tr>
  <tr>
    <td><tt>['jubatus']['pkg_manager']</tt></td>
    <td>String</td>
    <td>RHEL</td>
    <td>Temporary directory path to put rpm file</td>
    <td><tt>#{Chef::Config[:file_cache_path]}/jubatus.rpm</tt></td>
  </tr>
</table>

Usage
-----

#### jubatus::default
Just include `jubatus` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[jubatus]"
  ]
}
```

If you are using debian family OS, please include `apt` too:
```json
{
  "name":"my_node",
  "run_list": [
    "recipe[apt]"
    "recipe[jubatus]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

Author
------
moznion (moznion@gmail.com)

License
-------
MIT
