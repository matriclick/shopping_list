require 'bundler/capistrano'
require "rvm/capistrano"

default_run_options[:pty] = true
set :application, "shopping_list"
role :app, 'ec2-67-202-0-183.compute-1.amazonaws.com'
role :web, 'ec2-67-202-0-183.compute-1.amazonaws.com'
set :user, 'ubuntu'

task :production do
  set :scm_passphrase, "holagorda1"
  set :application, "shopping_list"
  server "ec2-67-202-0-183.compute-1.amazonaws.com", :app, :web, :db, :primary => true
  set :repository,  "git@github.com:matriclick/shopping_list.git"
  set :scm, "git"
  set :deploy_via, :copy
  set :branch, "master"
  set :user, "ubuntu"
  set :use_sudo, false
  set :keep_releases, 3
  
  set :deploy_to, "/home/#{user}/apps/#{application}"
  set :database_name, "#{application}"
end

ssh_options[:forward_agent] = true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :db do  
  task :db_config, :except => { :no_release => true }, :role => :app do  
    run "cp -f /home/#{user}/apps/#{application}/shared/database.yml #{release_path}/config/database.yml" 
    run "cd #{release_path} && rake RAILS_ENV=production db:create" 
  end 
  
  task :run_migration, :role => :app do
    run "cd #{release_path} && rake RAILS_ENV=production db:migrate"
    run "cd #{release_path} && rake RAILS_ENV=production db:seed"
  end
end

namespace :rvm do
  task :trust_rvmrc do
    run "rvm rvmrc trust #{release_path}"
  end
end

#namespace :sitemap do
#  task :refresh_sitemaps do
#    run "cd #{latest_release} && bundle exec rake sitemap:refresh RAILS_ENV=#{rails_env}"
#  end
#end

namespace :assets  do
  namespace :symlinks do
    desc "Setup application symlinks for shared assets"
    task :setup, :roles => [:app, :web] do
      shared_assets.each { |link| run "mkdir -p #{shared_path}/#{link}" }
    end

    desc "Link assets for current deploy to the shared location"
    task :update, :roles => [:app, :web] do
      shared_assets.each do |link|
        run "rm -rf #{release_path}/#{link}"
        run "ln -s #{shared_path}/#{link} #{release_path}/#{link}"
      end
    end
  end
end

#after "deploy", "sitemap:refresh_sitemaps"
after "deploy:finalize_update", "db:db_config"
after "db:db_config", "rvm:trust_rvmrc"
after "rvm:trust_rvmrc", "db:run_migration"
before "deploy:symlink", "deploy:cleanup"

#before "deploy:setup" do
#  assets.symlinks.setup
#end

#before "deploy:symlink" do
#  assets.symlinks.update
#end

