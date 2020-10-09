# config valid for current version and patch releases of Capistrano
lock "~> 3.14.1"

set :application, "LinGoChan"
set :repo_url, "git@github.com:YoooTooo/LinGoChan.git"
set :branch, "master"

# deploy先のディレクトリ。
set :deploy_to, '/var/www/project/LinGoChan'

# シンボリックリンクをはるフォルダ。
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public')

# 保持するバージョンの個数
set :keep_releases, 5

# rubyのバージョン
set :rbenv_ruby, '2.6.6'

#.rbenvの場所を指定する
set :rbenv_custom_path, '/home/yoootooo/.rbenv'

#出力するログのレベル。
set :log_level, :debug

#sshキーのための記述, EC2のキーの所在を明記。root@8da3ac5aae89コンテナにおけるpath
#set :ssh_options, auth_methods: ['publickey'],
#                  keys: ['~/.ssh/yoootooo.pem'],
#                  forward_agent: true

#root@8da3ac5aae89コンテナにおけるsshキー, EC2のキーをagent-addする記述。ec2-user
set :ssh_options, {
  keys: %w{~/.ssh/yoootooo.pem ~/.ssh/id_rsa},
  forward_agent: true,
  auth_methods: %w{publickey}
}

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

  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end


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
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
