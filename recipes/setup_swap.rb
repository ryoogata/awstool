ohai "reload" do
  action :reload
end

bash 'create swapfile' do
  code <<-EOC
          dd if=/dev/zero of=/swap.img bs=1M count=2408 &&
          chmod 600 /swap.img
          mkswap /swap.img
  EOC
  only_if { not node[:ec2].nil? and ( node[:ec2][:instance_type] == 't1.micro' or node[:ec2][:instance_type] == 't2.micro' ) }
  creates "/swap.img"
end

mount '/dev/null' do
  action :enable
  device '/swap.img'
  fstype 'swap'
  only_if { not node[:ec2].nil? and ( node[:ec2][:instance_type] == 't1.micro' or node[:ec2][:instance_type] == 't2.micro' ) }
end

bash 'activate swap' do
  code 'swapon -ae'
  only_if "test `cat /proc/swaps | wc -l` -eq 1"
end
