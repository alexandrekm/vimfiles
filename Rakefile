require 'parseconfig'

task :update do
  `git pull`
  `git submodule update --init`
  cmd = "git submodule foreach '" +
    "cd ~/.vim/$path;" +
    "git checkout master;" +
    "git pull'"
  `#{cmd}`
  `git add .`
  `git commit -m "Update plugins."`
  puts "Plugins updated."
end

task :install, :plugin_repository, :plugin_name do |t, args|
  plugin_repository = args[:plugin_repository]
  plugin_name = args[:plugin_name]
  `git submodule add #{plugin_repository} bundle/#{plugin_name}`
  `git commit -m "Install #{plugin_name}"`
  `git status`
  puts "Plugin '#{plugin_name}' installed."
end

def remove_group(file_path, group_name)
  config = ParseConfig.new(file_path)
  config.params.delete(group_name)
  config.groups.delete(group_name)
  file = File.open(file_path, 'w')
  config.write(file)
  file.close
end

task :remove, :plugin_name do |t, args|
  plugin_name = args[:plugin_name]
  submodule_path = "bundle/#{plugin_name}"
  config_group_name = "submodule \"#{submodule_path}\""
  remove_group('.gitmodules', config_group_name)
  remove_group('.git/config', config_group_name)
  `git add .`
  `git rm --cached #{submodule_path}`
  `git commit -m "Remove #{plugin_name}"`
  `rm -rf #{submodule_path}`
  `rm -rf .git/modules/bundle/#{plugin_name}`
  puts "Plugin '#{plugin_name}' removed."
end

