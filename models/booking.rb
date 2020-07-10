require_relative('../db/sql_runner')

class Booking

    attr_reader :id
    attr_accessor :member_id, :yoga_session_id

    def initialize(options)
        @id = options['id'].to_i if options['id'] 
        @member_id = options['member_id'].to_i
        @yoga_session_id = options['yoga_session_id'].to_i
    end

end