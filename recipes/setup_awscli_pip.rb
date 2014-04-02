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

python_pip "awscli" 
