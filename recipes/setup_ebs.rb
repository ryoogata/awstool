aws = data_bag_item("#{node["aws"]["creds"]["databag"]}", "#{node["aws"]["creds"]["item"]}")

aws_ebs_volume "ebs_volume" do
  aws_access_key aws['aws_access_key_id']
  aws_secret_access_key aws['aws_secret_access_key']
  size "#{node["aws"]["ebs"]["size"]}".to_i
  device "/dev/sdi"
  action [ :create, :attach ]
end
