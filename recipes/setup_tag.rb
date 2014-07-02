aws_resource_tag node['ec2']['instance_id'] do
  aws_access_key #{node["aws"]["_ACCESS_KEY"]}
  aws_secret_access_key #{node["aws"]["_SECRET_KEY"]}
  tags({"Name" => "www.example.com app server"})
  action :update
end
