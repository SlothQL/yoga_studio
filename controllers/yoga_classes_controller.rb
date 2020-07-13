require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/yoga_session.rb')
require_relative('../models/yoga_class.rb')
also_reload('../models/*')

get '/classes' do
    @yoga_classes = YogaClass.all()
    erb(:"yoga_classes/index")
end

get '/classes/new' do
    erb(:"yoga_classes/new")
end

post '/classes' do
    new_class = YogaClass.new(params)
    new_class.save()
    redirect to '/classes'
end

get '/classes/:id/edit' do
    @update_class = YogaClass.find_by_id(params['id'].to_i)
    erb(:"yoga_classes/edit")
end

post '/classes/:id' do
    @updated_class = YogaClass.new(params)
    @updated_class.update()
    redirect to '/classes'
end