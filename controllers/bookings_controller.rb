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
    @all_bookings = Booking.all()
    @b = @all_bookings.find { |booking| booking.member_id == params["member_id"].to_i && booking.yoga_session_id == params["yoga_session_id"].to_i}
    if @b
        erb(:"bookings/exist")
    else 
        new_booking= Booking.new(params)
        new_booking.save()
        redirect to "/sessions/#{params['yoga_session_id']}"
    end
end

post '/bookings/:id/delete' do
    @booking = Booking.find_by_id(params['id'].to_i)
    @booking.delete()
    redirect to "/sessions/#{params['yoga_session_id']}"
end