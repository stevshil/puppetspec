# puppetspec

## Puppet RSpec and ServerSpec testing

This repo is for use with Jenkins RSpec and ServerSpec demo

Note that the kitchen.yml security_group_ids will need to be set to the one for your stack

To create a new puppet rspec test you should run;
rspec-puppet-init

Then add any further dependency modules into the fixtures modules directory

This also includes an RSpec test for a puppet module that has dependencies on puppet forge module
