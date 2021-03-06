# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'achieve123'
set :repo_url, 'https://github.com/seiyamiyaoka/achieve123.git'
# Default branch is :master
set :branch, ENV['BRANCH'] || 'master'
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
 set :deploy_to, '/var/www/rails/achieve'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
 set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
 set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opst/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :rbenv_type, :system # :system or :user
set :rbenv_ruby, '2.3.0'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value
 set :keep_releases, 5

 set :unicorn_pid, "#{shared_path}/tmp/pids/unicorn.pid"

 namespace :deploy do
   desc 'Restart application'
     task :restart do
       invoke 'unicorn:restart'
     end
   desc 'Create database'
   task :db_create do
     on roles(:db) do |host|
       with rails_env: fetch(:rails_env) do
         within current_path do
           execute :bundle, :exec, :rake, 'db:create'
         end
       end
     end
   end
 end
