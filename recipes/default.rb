#
# Cookbook:: vim
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


if node['vim']['pathogen']
  include_recipe 'vim::pathogen'
end

template "#{ENV['HOME']}/.vimrc" do
  source 'vimrc.erb'
  mode 00644
  owner node['dotfiles']['user']
  group node['dotfiles']['group']
end
