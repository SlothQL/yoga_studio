require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')
require_relative('../models/yoga_session.rb')
require_relative('../models/yoga_class.rb')
also_reload('../models/*')

get '/members' do
    @members = Member.all()
    erb(:"members/index")
end

get '/members/new' do
    erb(:"members/new")
end

post '/members' do
    new_member= Member.new(params)
    new_member.save()
    redirect to '/members'
end

get '/members/:id' do
    @member = Member.find_by_id(params['id'].to_i)
    @sessions = @member.sessions()
    @classes = @member.classes()
    erb(:"members/show")
end

get '/members/:id/edit' do
    @member = Member.find_by_id(params['id'].to_i)
    erb(:"members/edit")
end

post '/members/:id' do
    @member = Member.new(params)
    @member.update()
    redirect to "/members/#{params['id']}"
end