include_recipe "route53"

route53_record "create a record" do
  name "#{node['aws']['route53']['hostname']}.#{node['aws']['route53']['zonename']}"
  value node['ec2']['public_ipv4']
  type  "A"
  zone_id               node[:route53][:zone_id]
  aws_access_key_id     node[:route53][:aws_access_key_id]
  aws_secret_access_key node[:route53][:aws_secret_access_key]
  overwrite true
  action :create
end

# route53_record "delete a record" do
#   name "#{node['aws']['route53']['hostname']}.#{node['aws']['route53']['zonename']}"
#   value node['ec2']['public_ipv4']
#   type  "A"
#   zone_id               node[:route53][:zone_id]
#   aws_access_key_id     node[:route53][:aws_access_key_id]
#   aws_secret_access_key node[:route53][:aws_secret_access_key]
#   overwrite true
#   action :delete
# end
