# -*-mode: ruby;-*-
# vim: set ft=ruby:

Pry.config.auto_indent = false

# fixes missing reload! in a zeus console
# see https://github.com/burke/zeus/issues/466
# might not work against all rails versions
if Kernel.const_defined?(:Rails) && Rails.env
  require File.join(Rails.root,"config","environment")
  require 'rails/console/app'
  require 'rails/console/helpers'
  extend Rails::ConsoleMethods
end
