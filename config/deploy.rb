lock '3.4.0'

set :application, 'alcups'
set :repo_url, 'https://github.com/bierasolutions/alchups.git'
set :deploy_to, "/home/rails/"

#set :rbenv_type, :user
#set :rbenv_ruby, '2.2.1'
#set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
#set :rbenv_map_bins, %w{rake gem bundle ruby rails}

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
