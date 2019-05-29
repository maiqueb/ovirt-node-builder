# ovirt-node-builder
Vagrant based ovirt host builder. These can be afterwards added to a running
ovirt-engine.

## Instructions
Simply clone the repo, and run vagrant up.

To customize the number of nodes, update the $num_instances variable within the
Vagrantfile.

The first node - **ovirt-node1** - will always be the *master* - e.g. where the
NFS mount will be located.

## Follow up actions
In order to add these hosts to an existing ovirt-engine, the *vagrant* user
password has to be set up.

To set it, execute the command *passwd*.

## Dependencies
* [vagrant](https://www.vagrantup.com/)
* [vagrant libvirt provider](https://github.com/vagrant-libvirt/vagrant-libvirt)
