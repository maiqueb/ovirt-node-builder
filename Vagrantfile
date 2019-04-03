# -*- mode: ruby -*-
# vi: set ft=ruby :

$instance_name_prefix = "ovirt-node"
$num_instances = 2
$ip_prefix="192.168.33.5%d"
$memory = "4096"
$cpus = 2

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  (1..$num_instances).map do |i|
    config.vm.define vm_name = "%s%01d" % [$instance_name_prefix, i] do |node|
      node.vm.hostname = vm_name + ".maiqueb.lab.com"
      node.vm.network "private_network", ip: $ip_prefix % i
      node.vm.provider :libvirt do |vm|
        vm.memory = $memory
        vm.cpus = $cpus
      end
      $role = i == 1 ? "master" : "slave"
      node.vm.provision "shell", env: {"ROLE" => $role}, inline: <<-SHELL
        yum install -y epel-release
        yum install -y \
          http://resources.ovirt.org/pub/yum-repo/ovirt-release43.rpm
        yum update -y
        /vagrant/configure-node.sh
      SHELL
    end
  end
end
