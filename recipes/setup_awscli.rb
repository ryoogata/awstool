include_recipe "awstool::setup_awscli_#{node["aws"]["cli"]['install_method']}"

# 設定ファイル用の Directory を作成
directory "/root/.aws" do
  action :create
end

# 設定ファイルの設置
template "/root/.aws/config" do
  source "config.erb"
  owner "root"
  group "root"
  mode 0600
end
