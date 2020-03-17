set :deploy_to, "/home/ec2-user/bookbook"
set :rbenv_ruby, '2.5.7'
set :linked_files, %w{config/master.key .env}
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
namespace :deploy do
  desc 'Database'
  task :db_migrate do
    on roles(:app) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:migrate'
        end
      end
    end
  end
end
after 'bundler:install', 'deploy:db_migrate':
