require_relative 'contact'
require 'sinatra'

get ('/') do
  @contacts = Contact.all
  erb(:index)
end

get ('/contacts') do
  @contacts = Contact.all
  erb(:contacts)
end

get ('/about') do
  erb(:about)
end

get ('/contacts/new') do
  erb(:new)
end

get ('/contacts/:id') do
  @contact = Contact.find(params[:id].to_i)
    erb(:show_contact)
end

post ('/contacts') do
  Contact.create(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    note: params[:note]
  )
  redirect to('/contacts')
end

after do
  ActiveRecord::Base.connection.close
end
