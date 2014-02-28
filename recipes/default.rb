include_recipe 'ruby_build'
include_recipe 'rbenv::system'

package 'libsqlite3-dev'

rbenv_ruby '2.1.0'
rbenv_global '2.1.0'

rbenv_gem 'rails' do
  rbenv_version  '2.1.0'
  action :install
end

git '/home/vagrant/Tiny.House' do
  repository 'https://github.com/jjshoe/Tiny.House.git'
  reference 'master'
  enable_checkout false
  action :sync
  user 'vagrant'
  group 'vagrant'
end

rbenv_script 'install_gems' do
  rbenv_version '2.1.0'
  user          'root'
  group         'root'
  cwd           '/home/vagrant/Tiny.House'
  code          %{bundle update}
end

rbenv_script 'migrate_rails_database' do
  rbenv_version '2.1.0'
  user          'vagrant'
  group         'vagrant'
  cwd           '/home/vagrant/Tiny.House'
  code          %{rake RAILS_ENV=development db:migrate}
end