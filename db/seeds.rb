require_relative('../models/booking.rb')
require_relative('../models/member.rb')
require_relative('../models/yoga_class.rb')
require_relative('../models/yoga_session.rb')
require('pry-byebug')

Member.delete_all()

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

member1.save()
member2.save()


binding.pry
nil