# include gem in Gemfile

# create Procfile/run this config file - declares what commands are run by your app's dynos

workers Integer(ENV['WEB_CONCURRENCY'] || 2)
# how many workers per dyno (RAM)
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
# how many threads per worker (CPU)
threads threads_count, threads_count
# best practice: set min equal to max threads_count

# preload_app!
# reduces startup time of individual puma worker processes

rackup      DefaultRackup
# tells Puma how to start your app/points to config.ru
port        ENV['PORT']     || 3000
# port that Puma binds to - heroku sets this but locally it should be rails default 3000
environment ENV['RACK_ENV'] || 'development'
# sets environment - heroku sets this to 'production'

on_worker_boot do
  # control over connecting workers to db
  ActiveSupport.on_load(:active_record) do
    config = ActiveRecord::Base.configurations[Rails.env] ||
                Rails.application.config.database_configuration[Rails.env]
    config['pool'] = ENV['MAX_THREADS'] || 16
    ActiveRecord::Base.establish_connection(config)
  end
end
