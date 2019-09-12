# For more options, see http://capistranorb.com/documentation/getting-started/configuration/#
# config valid only for current version of Capistrano
lock '3.3.5'
set :application, 'transcript-editor'
set :repo_url, 'https://github.com/WGBH/transcript-editor.git'
set :rails_env, 'production'
set :rvm_ruby_version, '2.3.0'

# If the branch is not set with an env var, then ask for it.
if ENV['AAPB_BRANCH']
  set :branch, ENV['AAPB_BRANCH']
else
  ask :branch, 'master'
end

set :passenger_restart_command, 'rvmsudo /usr/sbin/apachectl restart'

# Require confirmation by user if the repo is in a dirty state.
include GitHelper
verify_git_status!

set :linked_dirs, fetch(:linked_dirs, []).push('log')
set :linked_files, %w{config/database.yml config/application.yml}
