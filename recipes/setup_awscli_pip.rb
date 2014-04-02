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
