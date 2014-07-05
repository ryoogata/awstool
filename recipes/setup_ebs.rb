aws_ebs_volume "ebs_volume" do
  aws_access_key "#{node["aws"]["_ACCESS_KEY"]}"
  aws_secret_access_key "#{node["aws"]["_SECRET_KEY"]}"
  size "#{node["aws"]["ebs"]["size"]}".to_i
  device "/dev/sdi"
  action [ :create, :attach ]
end
