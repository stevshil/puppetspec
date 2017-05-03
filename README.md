# puppetspec

## Puppet RSpec and ServerSpec testing

This repo is for use with Jenkins RSpec and ServerSpec demo

Note that the kitchen.yml security_group_ids will need to be set to the one for your stack

To create a new puppet rspec test you should run;
rspec-puppet-init

Then add any further dependency modules into the fixtures modules directory

This also includes an RSpec test for a puppet module that has dependencies on puppet forge module

As well as using Kitchen which makes use of the test/integration folder, there is a Rake server spec test that uses Vagrant.

The Vagrantfile and bin folder are used by the test/spec and test/Rakefile, and you can run the test from the test directory using;
	rake spec

You will need to destroy your VM after the run.

The kitchen serverspec testing is done from this directory (where the README.md file is) and you should change the .kitchen.yml file based on your virtualisation environment.  The tests are run via;
	kitchen test

If kitchen fails you will need to delete the VM, but if all tests pass successfully then kitchen will destroy the VM.
