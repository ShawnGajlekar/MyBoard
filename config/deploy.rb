# config valid only for current version of Capistrano
lock "3.7.2"

set :application, "2.NoticeBoard_chat"
set :repo_url, "git@example.com:ShawnGajlekar/2.NoticeBoard_chat.git"
set :deploy_to 'opt/www/22.NoticeBoard_chat'
set :user, 'deploy'
set :linked_dirs ,%w{log tmp/pids tmp/cache tmp/sockets}

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
	%w[start stop restart].each do |command|
desc 'Manage Unicorn'
task command do
on roles(:app), in: :sequence, wait: 1 do
execute "/etc.init.d/unicorn_#{fetch(:application)} #{command}"
end
end
end

after :publishing, :restart

after :restart, :clear_cache do
on roles(:web), in: :groups, limit: 3, wait: 10 do
end
end
