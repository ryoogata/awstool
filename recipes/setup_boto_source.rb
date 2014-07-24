include_recipe "git::source"

git "/usr/local/src/boto" do
  repository "git://github.com/boto/boto.git"
  reference "master"
  action :sync
end

package "python-setuptools" do
  action :install
end

script "install-boto" do
  interpreter "bash"
  user "root"
  cwd "/usr/local/src/boto"
  code <<-EOH
    python setup.py install
  EOH
#  not_if {File.exists?("/usr/bin/aws")}
end
