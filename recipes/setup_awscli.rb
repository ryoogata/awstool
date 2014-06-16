include_recipe "awstool::setup_awscli_#{node["aws"]["cli"]['install_method']}"

# 設定ファイル用の Directory を作成
case node['platform']
when "centos"
  directory "/root/.aws" do
    action :create
  end
when "amazon"
  directory "/home/ec2-user/.aws" do
    action :create
    owner "ec2-user"
    group "ec2-user"
  end
end

# 設定ファイルの設置
case node['platform']
when "centos"
  template "/root/.aws/config" do
    source "config.erb"
    owner "root"
    group "root"
    mode 0600
  end
when "amazon"
  template "/home/ec2-user/.aws/config" do
    source "config.erb"
    owner "ec2-user"
    group "ec2-user"
    mode 0600
  end
end
