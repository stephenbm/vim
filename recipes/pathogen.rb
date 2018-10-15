%w(autoload bundle).each do |dir|
  directory "#{ENV['HOME']}/.vim/#{dir}" do
    recursive true
    owner node['dotfiles']['user']
    group node['dotfiles']['group']
  end
end

cookbook_file "#{ENV['HOME']}/.vim/autoload/pathogen.vim" do
  source 'pathogen.vim'
  mode 00644
  owner node['dotfiles']['user']
  group node['dotfiles']['group']
end

directory "#{ENV['HOME']}/.vim/bundle/Dockerfile"
%w(ftdetect syntax).each do |ft|
  directory "#{ENV['HOME']}/.vim/bundle/Dockerfile/#{ft}" do
    owner node['dotfiles']['user']
    group node['dotfiles']['group']
  end

  cookbook_file "#{ENV['HOME']}/.vim/bundle/Dockerfile/#{ft}/dockerfile.vim" do
    source "dockerfile/#{ft}.vim"
    mode 00644
    owner node['dotfiles']['user']
    group node['dotfiles']['group']
  end
end

node['vim']['git-plugins'].each do |plugin, source|
  git "#{ENV['HOME']}/.vim/bundle/#{plugin}" do
    repository "https://github.com/#{source}.git"
    action :export
    user node['dotfiles']['user']
    group node['dotfiles']['group']
  end
end
