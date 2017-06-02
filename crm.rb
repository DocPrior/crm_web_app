require_relative 'contact'
require 'sinatra'

get ('/') do
  erb(:index)
end

get ('/contacts') do
  @contacts = Contact.all
  erb(:contacts)
end

get ('/about') do
  erb(:about)
end

@contacts_count = Contact.count

after do
  ActiveRecord::Base.connection.close
end
