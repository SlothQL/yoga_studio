require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/yoga_session.rb')
require_relative('controllers/members_controller')
require_relative('controllers/yoga_classes_controller')
require_relative('controllers/yoga_sessions_controller')

get '/' do
    @all_sessions = YogaSession.all()
    erb(:index)
end