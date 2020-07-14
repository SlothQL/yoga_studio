require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')
require_relative('../models/yoga_session.rb')
require_relative('../models/yoga_class.rb')
also_reload('../models/*')

get '/sessions/new' do
    @all_classes = YogaClass.all()
    erb(:"yoga_sessions/new")
end

post '/sessions/new' do
    new_session= YogaSession.new(params)
    new_session.save()
    redirect to '/'
end

post '/' do
    @new_session= YogaSession.new(params)
    @new_session.save()
    redirect to '/'
end

get '/sessions/:id' do
    @yoga_session = YogaSession.find_by_id(params['id'].to_i)
    @yoga_class = @yoga_session.yoga_class()
    @members = @yoga_session.members()
    erb(:"yoga_sessions/show")
end

get '/sessions/:id/edit' do
    @yoga_session = YogaSession.find_by_id(params['id'].to_i)
    @yoga_class = @yoga_session.yoga_class()
    erb(:"yoga_sessions/edit")
end

post '/sessions/:id' do
    updated_session = YogaSession.new(params)
    updated_session.update()
    redirect to '/'
end

post '/sessions/:id/delete' do
    @session = YogaSession.find_by_id(params['id'].to_i)
    @session.delete()
    redirect to '/'
end