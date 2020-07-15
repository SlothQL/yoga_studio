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
    'phone' => '075863465'
})

member2 = Member.new({
    'first_name' => 'Bernard',
    'last_name' => 'Lowe',
    'street' => 'Oakwood Drift 23',
    'postcode' => '94108',
    'city' => 'San Francisco',
    'country' => 'United States of America',
    'email' => 'b.lowe@delos.com',
    'phone' => '0710097630'
})

member3 = Member.new({
    'first_name' => 'Maeve',
    'last_name' => 'Millay',
    'street' => 'Lee Place 7',
    'postcode' => '73045',
    'city' => 'Sweetwater',
    'country' => 'United States of America',
    'email' => 'maeve.m@yahoo.com',
    'phone' => '072878445'
})

member4 = Member.new({
    'first_name' => 'Teddy',
    'last_name' => 'Flood',
    'street' => 'Lee Place 9',
    'postcode' => '73045',
    'city' => 'Sweetwater',
    'country' => 'United States of America',
    'email' => 't.flood@aol.com',
    'phone' => '073665896'
})

member5 = Member.new({
    'first_name' => 'Robert',
    'last_name' => 'Ford',
    'street' => 'Webbs Place 5',
    'postcode' => '94118',
    'city' => 'San Francisco',
    'country' => 'United States of America',
    'email' => 'r.ford@delos.com',
    'phone' => '079776813'
})

member6 = Member.new({
    'first_name' => 'Ashley',
    'last_name' => 'Stubbs',
    'street' => 'Hartland Oak 6',
    'postcode' => '94134',
    'city' => 'San Francisco',
    'country' => 'United States of America',
    'email' => 'a.stubbs@delos.com',
    'phone' => '065320078'
})

member7 = Member.new({
    'first_name' => 'Charlotte',
    'last_name' => 'Hale',
    'street' => 'Neville Rise 42',
    'postcode' => '94153',
    'city' => 'San Francisco',
    'country' => 'United States of America',
    'email' => 'c.hale@delos.com',
    'phone' => '065320078'
})

member8 = Member.new({
    'first_name' => 'Clementine',
    'last_name' => 'Pennyfeather',
    'street' => 'Lee Place 7',
    'postcode' => '73045',
    'city' => 'Sweetwater',
    'country' => 'United States of America',
    'email' => 'c-feather@gmail.com',
    'phone' => '073546054'
})

member9 = Member.new({
    'first_name' => 'Theresa',
    'last_name' => 'Cullen',
    'street' => 'Adelaide Lane 65',
    'postcode' => '94142',
    'city' => 'San Francisco',
    'country' => 'United States of America',
    'email' => 't.cullen@delos.com',
    'phone' => '075009831'
})

member10 = Member.new({
    'first_name' => 'Lawrence',
    'last_name' => 'Gonzales',
    'street' => 'King Mead 4',
    'postcode' => '73512',
    'city' => 'Pariah',
    'country' => 'United States of America',
    'email' => 'el_lazo@mail.ru',
    'phone' => '071987697'
})

member1.save()
member2.save()
member3.save()
member4.save()
member5.save()
member6.save()
member7.save()
member8.save()
member9.save()
member10.save()

yoga1 = YogaClass.new({
    'category' => 'Bikram Yoga',
    'title' => 'Hot Yoga for Beginners'
})

yoga2 = YogaClass.new({
    'category' => 'Yin Yoga',
    'title' => 'Mental Balance & Grounding'
})

yoga3 = YogaClass.new({
    'category' => 'Vinyasa Yoga',
    'title' => 'Reunite with your Center'
})

yoga4 = YogaClass.new({
    'category' => 'Vinyasa Yoga',
    'title' => 'Sunrise' 
})

yoga5 = YogaClass.new({
    'category' => 'Vinyasa Yoga',
    'title' => 'Healthy Energy Flow' 
})

yoga6 = YogaClass.new({
    'category' => 'Bikram Yoga',
    'title' => 'Bikram Yoga Workout'
})

yoga7 = YogaClass.new({
    'category' => 'Yin Yoga',
    'title' => 'Affirmations for Healing'
})

yoga8 = YogaClass.new({
    'category' => 'Yin Yoga',
    'title' => 'Yin Yoga for Inner Peace'
})

yoga1.save()
yoga2.save()
yoga3.save()
yoga4.save()
yoga5.save()
yoga6.save()
yoga7.save()
yoga8.save()


session1 = YogaSession.new({
    'yoga_class_id' => yoga1.id,
    'wday' => "Wednesday",
    'schedule' => "18:00",
    'instructor' => "Rachel"
})

session2 = YogaSession.new({
    'yoga_class_id' => yoga1.id,
    'wday' => "Friday",
    'schedule' => "09:00",
    'instructor' => 'Manuel'
})

session3 = YogaSession.new({
    'yoga_class_id' => yoga2.id,
    'wday' => "Thursday",
    'schedule' => "15:00",
    'instructor' => 'Karen'
}) 

session4 = YogaSession.new({
    'yoga_class_id' => yoga3.id,
    'wday' => "Sunday",
    'schedule' => "08:00",
    'instructor' => 'Manuel'
})

session5 = YogaSession.new({
    'yoga_class_id' => yoga4.id,
    'wday' => "Monday",
    'schedule' => "09:00",
    'instructor' => 'Manuel'
})

session6 = YogaSession.new({
    'yoga_class_id' => yoga2.id,
    'wday' => "Monday",
    'schedule' => "10:00",
    'instructor' => 'Rachel'
})

session7 = YogaSession.new({
    'yoga_class_id' => yoga5.id,
    'wday' => "Monday",
    'schedule' => "15:00",
    'instructor' => 'Rachel'
})

session8 = YogaSession.new({
    'yoga_class_id' => yoga4.id,
    'wday' => "Tuesday",
    'schedule' => "08:00",
    'instructor' => 'Karen'
})

session9 = YogaSession.new({
    'yoga_class_id' => yoga7.id,
    'wday' => "Tuesday",
    'schedule' => "11:00",
    'instructor' => 'Manuel'
})

session10 = YogaSession.new({
    'yoga_class_id' => yoga6.id,
    'wday' => "Tuesday",
    'schedule' => "16:00",
    'instructor' => 'Rachel'
})

session11 = YogaSession.new({
    'yoga_class_id' => yoga8.id,
    'wday' => "Tuesday",
    'schedule' => "16:00",
    'instructor' => 'Karen'
})

session12 = YogaSession.new({
    'yoga_class_id' => yoga5.id,
    'wday' => "Wednesday",
    'schedule' => "12:00",
    'instructor' => 'Karen'
})

session13 = YogaSession.new({
    'yoga_class_id' => yoga7.id,
    'wday' => "Wednesday",
    'schedule' => "09:00",
    'instructor' => 'Manuel'
})

session14 = YogaSession.new({
    'yoga_class_id' => yoga3.id,
    'wday' => "Wednesday",
    'schedule' => "10:00",
    'instructor' => 'Manuel'
})

session15 = YogaSession.new({
    'yoga_class_id' => yoga2.id,
    'wday' => "Thursady",
    'schedule' => "17:00",
    'instructor' => 'Manuel'
})

session16 = YogaSession.new({
    'yoga_class_id' => yoga1.id,
    'wday' => "Thursady",
    'schedule' => "19:00",
    'instructor' => 'Rachel'
})

session17 = YogaSession.new({
    'yoga_class_id' => yoga5.id,
    'wday' => "Friday",
    'schedule' => "17:00",
    'instructor' => 'Karen'
})

session18 = YogaSession.new({
    'yoga_class_id' => yoga1.id,
    'wday' => "Saturday",
    'schedule' => "10:00",
    'instructor' => 'Karen'
})

session19 = YogaSession.new({
    'yoga_class_id' => yoga3.id,
    'wday' => "Saturday",
    'schedule' => "11:00",
    'instructor' => 'Karen'
})

session20 = YogaSession.new({
    'yoga_class_id' => yoga7.id,
    'wday' => "Saturday",
    'schedule' => "11:00",
    'instructor' => 'Rachel'
})

session21 = YogaSession.new({
    'yoga_class_id' => yoga8.id,
    'wday' => "Sunday",
    'schedule' => "12:00",
    'instructor' => 'Manuel'
})

session1.save()
session2.save()
session3.save()
session4.save()
session5.save()
session6.save()
session7.save()
session8.save()
session9.save()
session10.save()
session11.save()
session12.save()
session13.save()
session14.save()
session15.save()
session16.save()
session17.save()
session18.save()
session19.save()
session20.save()
session21.save()

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
    'yoga_session_id' => session6.id
})

booking5 = Booking.new({
    'member_id' => member8.id,
    'yoga_session_id' => session4.id
})

booking6 = Booking.new({
    'member_id' => member9.id,
    'yoga_session_id' => session12.id
})

booking7 = Booking.new({
    'member_id' => member10.id,
    'yoga_session_id' => session20.id
})

booking8 = Booking.new({
    'member_id' => member10.id,
    'yoga_session_id' => session7.id
})

booking9 = Booking.new({
    'member_id' => member6.id,
    'yoga_session_id' => session1.id
})

booking10 = Booking.new({
    'member_id' => member6.id,
    'yoga_session_id' => session15.id
})

booking11 = Booking.new({
    'member_id' => member7.id,
    'yoga_session_id' => session4.id
})

booking12 = Booking.new({
    'member_id' => member7.id,
    'yoga_session_id' => session17.id
})

booking1.save()
booking2.save()
booking3.save()
booking4.save()
booking5.save()
booking6.save()
booking7.save()
booking8.save()
booking9.save()
booking10.save()
booking11.save()
booking12.save()

binding.pry
nil