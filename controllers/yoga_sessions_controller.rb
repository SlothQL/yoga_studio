require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')
require_relative('../models/yoga_session.rb')
require_relative('../models/yoga_class.rb')
also_reload('../models/*')

get '/sessions/new' do
    erb(:"yoga_sessions/new")
end

post '/' do
    new_session= YogaSession.new(params)
    new_session.save()
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
    erb(:"yoga_sessions/edit")
end