require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/members_controller')
require_relative('controllers/yoga_classes_controller')

get '/' do
    erb(:index)
end