# python-pip のインストール
case node['platform']
when "centos"
	package "python-pip" do
		action :install
	end
end

# pip のインストール
easy_install_package "pip" do
	action :install
end

# pip 経由の aws cli のインストール
execute "pip install" do
        command "/usr/bin/pip install awscli"
end

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
