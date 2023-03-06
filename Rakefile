require_relative "./config/environment"
require "sinatra/activerecord/rake"

desc "Start the server"
task :server do
  if ActiveRecord::Base.connection.migration_context.needs_migration?
    puts "Migrations are pending. Make sure to run `rake db:migrate` first."
    return
  end

  ENV["RACK_ENV"] ||= "development"
  ENV["PORT"] ||= "9292"
  rackup = "rackup -p #{ENV["PORT"]}"

  if ENV["RACK_ENV"] == "production"
    exec rackup
  else
    exec "bundle exec rerun -b '#{rackup}'"
  end

  
end
