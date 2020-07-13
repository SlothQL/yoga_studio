require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/yoga_session.rb')
require_relative('../models/yoga_class.rb')
also_reload('../models/*')

get '/classes' do
    @yoga_sessions = YogaSession.all()
    erb(:"yoga_classes/index")
end