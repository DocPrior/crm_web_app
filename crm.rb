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
  @contact = Contact.where(:id => params[:id]).first
  if @contact
    erb(:show_contact)
  else
    raise Sinatra::NotFound
  end
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

get ('/contacts/:id/edit') do
  @contact = Contact.where(:id => params[:id]).first
  if @contact
    erb(:edit_contact)
  else
    raise Sinatra::NotFound
  end
end

put ('/contacts/:id') do
  @contact = Contact.where(:id => params[:id]).first
  if @contact
    @contact.update(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    note: params[:note]
    )

    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

after do
  ActiveRecord::Base.connection.close
end
