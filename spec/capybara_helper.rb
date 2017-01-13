require 'capybara'
require 'capybara/rspec'

Capybara.app = Sinatra::Application

require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
