# -*-mode: ruby;-*-
# vim: set ft=ruby:

Pry.config.auto_indent = false

if Kernel.const_defined?(:Rails) && Rails.env
  require File.join(Rails.root,"config","environment")
  require 'rails/console/app'
  require 'rails/console/helpers'

  extend Rails::ConsoleMethods
end
