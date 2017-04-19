require 'spec_helper'
 
describe "mywebapp" do
  context 'with default values for all parameters' do
    it { should contain_class('mywebapp') }
  end
 
  it { is_expected.to contain_package('nginx')}
  it { is_expected.to contain_file('/etc/nginx/nginx.conf')}
  it { is_expected.to contain_file('/etc/nginx/nginx.conf').that_notifies('Service[nginx]')}
  it { is_expected.to contain_file('/etc/nginx/conf.d/default.conf')}
  it { is_expected.to contain_service('nginx').with_ensure('running')}
  it { is_expected.to contain_service('nginx').with_enable('true')}
  it { is_expected.to contain_package('php-fpm')}
  it { is_expected.to contain_service('php-fpm').with_ensure('running')}
  it { is_expected.to contain_service('php-fpm').with_enable('true')}
   
end
