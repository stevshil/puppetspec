require 'spec_helper'

# describe 'mysql classes installed' do
#   it { is_expected.to contain_class('::mysql::server')}
#   it { is_expected.to contain_class('mysql::client') }
#   it { is_expected.to contain_class('mysql::bindings') }
#   it { is_expected.to contain_class('mysql::db') }
# end

describe 'mysqlmodule' do
  let(:facts) do
    { :osfamily => 'RedHat',
    :operatingsystemmajrelease => '7.2',
    :root_home => '',
    :puppetversion => '4.10.0',
    :operatingsystem => 'RedHat' }
  end

  it {is_expected.to contain_file_line('Edit my.cnf')}
end
