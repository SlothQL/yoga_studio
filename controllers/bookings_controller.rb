require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')
require_relative('../models/yoga_session.rb')
require_relative('../models/yoga_class.rb')
require_relative('../models/booking.rb')
also_reload('../models/*')

get '/bookings' do
    @all_members = Member.all()
    @all_sessions = YogaSession.all()
    erb(:"bookings/new")
end

post '/bookings/new' do
    new_booking= Booking.new(params)
    new_booking.save()
    redirect to "/sessions/#{params['yoga_session_id']}"
end