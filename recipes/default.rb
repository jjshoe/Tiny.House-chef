include_recipe 'ruby_build'
include_recipe 'rbenv::system'

rbenv_ruby '2.1.0'
rbenv_global '2.1.0'

rbenv_gem 'rails' do
  rbenv_version  '2.1.0'
  action :install
end

git "/home/vagrant/Tiny.House" do
  repository "https://github.com/jjshoe/Tiny.House.git"
  reference "master"
  action :sync
end
