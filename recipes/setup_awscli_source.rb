git "/usr/local/src/aws-cli" do
  repository "git://github.com/aws/aws-cli.git"
  reference "master"
  action :sync
end

package "python-setuptools" do
  action :install
end

script "install-aws-cli" do
  interpreter "bash"
  user "root"
  cwd "/usr/local/src/aws-cli"
  code <<-EOH
    python setup.py install
  EOH
end
