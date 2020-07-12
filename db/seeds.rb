require_relative('../models/booking.rb')
require_relative('../models/member.rb')
require_relative('../models/yoga_class.rb')
require_relative('../models/yoga_session.rb')
require('pry-byebug')

Booking.delete_all()
YogaSession.delete_all()
Member.delete_all()
YogaClass.delete_all()

member1 = Member.new({
    'first_name' => 'Dolores',
    'last_name' => 'Abernathy',
    'street' => 'Ranch Avenue 1',
    'postcode' => '73045',
    'city' => 'Sweetwater',
    'country' => 'United States of America',
    'email' => 'wyatt@gmail.com',
    'phone' => '075863465',
    'start_membership' => '02.10.2016'
})

member2 = Member.new({
    'first_name' => 'Bernard',
    'last_name' => 'Lowe',
    'street' => 'Oakwood Drift 23',
    'postcode' => '91501',
    'city' => 'Los Angeles',
    'country' => 'United States of America',
    'email' => 'b.lowe@delos.com',
    'phone' => '0710097630',
    'start_membership' => '22.04.2018'
})

member3 = Member.new({
    'first_name' => 'Maeve',
    'last_name' => 'Millay',
    'street' => 'Lee Place 7',
    'postcode' => '73045',
    'city' => 'Sweetwater',
    'country' => 'United States of America',
    'email' => 'maeve.m@yahoo.com',
    'phone' => '072878445',
    'start_membership' => '15.03.2020'
})

member4 = Member.new({
    'first_name' => 'Teddy',
    'last_name' => 'Flood',
    'street' => 'Lee Place 9',
    'postcode' => '73045',
    'city' => 'Sweetwater',
    'country' => 'United States of America',
    'email' => 'wyatt@gmail.com',
    'phone' => '073665896',
    'start_membership' => '01.11.2019'
})

member5 = Member.new({
    'first_name' => 'Robert',
    'last_name' => 'Ford',
    'street' => 'Webbs Place 5',
    'postcode' => '90222',
    'city' => 'Los Angeles',
    'country' => 'United States of America',
    'email' => 'r.ford@delos.com',
    'phone' => '079776813',
    'start_membership' => '04.12.2016'
})

member1.save()
member2.save()
member3.save()
member4.save()
member5.save()

yoga1 = YogaClass.new({
    'category' => 'Workout',
    'title' => 'Hot Yoga for Beginners',
    'duration' => 60
})

yoga2 = YogaClass.new({
    'category' => 'Yin Yoga',
    'title' => 'Intro to Yin Yoga',
    'duration' => 60
})

yoga3 = YogaClass.new({
    'category' => 'Vinyasa Yoga',
    'title' => 'Upperbody Strength',
    'duration' => 30
})


yoga1.save()
yoga2.save()
yoga3.save()

yoga1.category = "Bikram Yoga"
yoga1.update()

session1 = YogaSession.new({
    'yoga_class_id' => yoga1.id,
    'wday' => "Wednesday",
    'schedule' => "18:00"
})

session2 = YogaSession.new({
    'yoga_class_id' => yoga1.id,
    'wday' => "Friday",
    'schedule' => "09:00"
})

session1.save()
session2.save()

booking1 = Booking.new({
    'member_id' => member2.id,
    'yoga_session_id' => session1.id
})

booking2 = Booking.new({
    'member_id' => member2.id,
    'yoga_session_id' => session2.id
})

booking3 = Booking.new({
    'member_id' => member3.id,
    'yoga_session_id' => session1.id
})

booking4 = Booking.new({
    'member_id' => member4.id,
    'yoga_session_id' => session1.id
})

booking1.save()
booking2.save()
booking3.save()
booking4.save()

booking3.delete()

binding.pry
nil