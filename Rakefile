# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks

begin
    require "vlad"
    Vlad.load(:app => nil, :scm => "git")
  rescue LoadError
    # do nothing
  end
