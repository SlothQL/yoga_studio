require_relative('../models/booking.rb')
require_relative('../models/member.rb')
require_relative('../models/yoga_class.rb')
require_relative('../models/yoga_session.rb')
require('pry-byebug')

Member.delete_all()
YogaClass.delete_all()

member1 = Member.new({
    'title' => 'Miss',
    'first_name' => 'Dolores',
    'last_name' => 'Abernathy',
    'start_membership' => '02.10.2016'
})

member2 = Member.new({
    'title' => 'Mr',
    'first_name' => 'Bernard',
    'last_name' => 'Lowe',
    'start_membership' => '22.04.2018'
})

member3 = Member.new({
    'title' => 'Miss',
    'first_name' => 'Maeve',
    'last_name' => 'Millay',
    'start_membership' => '15.03.2020'
})

member4 = Member.new({
    'title' => 'Mr',
    'first_name' => 'Teddy',
    'last_name' => 'Flood',
    'start_membership' => '01.11.2019'
})

member5 = Member.new({
    'title' => 'Dr.',
    'first_name' => 'Robert',
    'last_name' => 'Ford',
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

binding.pry
nil