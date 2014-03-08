require 'colorize'

task :update do
  cmd = "git submodule foreach '" +
    "cd ~/.vim/$path;" +
    "git checkout master;" +
    "git pull'"
  `#{cmd}`
  `git add .`
  `git commit -m "Update plugins."`
  puts "Plugins updated.".green
end

task :install, :plugin_repository, :plugin_name do |t, args|
  plugin_repository = args[:plugin_repository]
  plugin_name = args[:plugin_name]
  `git submodule add #{plugin_repository} bundle/#{plugin_name}`
  `git commit -m "Install #{plugin_name}"`
  `git status`
  puts "Plugin '#{plugin_name}' installed.".green
end

