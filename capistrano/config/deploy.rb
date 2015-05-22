set :application, 'application_name'
set :repo_url, 'git_repo_url'
set :branch, 'master'
set :keep_releases, 3
set :log_level, :info

# files we want symlinking to specific entries in shared.
set :linked_files, %w{files/to/link/foo files/to/link/bar}

# dirs we want symlinking to specific entries in shared.
set :linked_dirs, %w{dir/to/link/foo dir/to/link/bar}

namespace :deploy do

    task :composer do
      on roles(:web) do
        within release_path do
          execute 'composer', 'selfupdate'
          execute 'composer', 'install', '--no-dev', '--no-ansi', '--no-interaction', '--quiet'
        end
      end
    end

    after :updated, 'deploy:composer'
    after :finishing, 'deploy:cleanup'

end
