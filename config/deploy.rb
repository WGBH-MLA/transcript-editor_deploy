# For more options, see http://capistranorb.com/documentation/getting-started/configuration/#
# config valid only for current version of Capistrano
lock '3.3.5'
set :application, 'transcript-editor'
set :repo_url, 'https://github.com/WGBH/transcript-editor.git'
set :rails_env, 'production'
set :rvm_ruby_version, '2.3.0'

# set :passenger_environment_variables, { :path => '/home/ec2-user/bin/passenger-6.0.2/bin:$PATH' }
# set :passenger_restart_with_touch, true
# set :passenger_restart_command, 'rvmsudo /home/ec2-user/bin/passenger-6.0.2/bin/passenger-config restart-app /var/www/transcript-editor/current  --ignore-app-not-running'

# Require confirmation by user if the repo is in a dirty state.
include GitHelper
verify_git_status!

set :linked_dirs, fetch(:linked_dirs, []).push('log')
set :linked_files, %w{config/database.yml config/application.yml}
