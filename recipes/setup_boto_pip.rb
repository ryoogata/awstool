# python-pip のインストール
case node['platform']
when "centos","ubuntu"
  package "python-pip" do
    action :install
  end
end

# pip のインストール
easy_install_package "pip" do
  action :install
end

# pip 経由の boto のインストール
#execute "pip install" do
#  command "/usr/bin/pip install boto"
#end

python_pip "boto"
