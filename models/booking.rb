require_relative('../db/sql_runner')

class Booking

    attr_reader :id
    attr_accessor :member_id, :yoga_session_id

    def initialize(options)
        @id = options['id'].to_i if options['id'] 
        @member_id = options['member_id'].to_i
        @yoga_session_id = options['yoga_session_id'].to_i
    end

    def save()
        sql = "INSERT INTO bookings (member_id, yoga_session_id)
        VALUES ($1, $2) RETURNING id"
        values = [@member_id, @yoga_session_id]
        new_booking = SqlRunner.run(sql, values).first
        @id = new_booking['id'].to_i
    end

    def self.all()
        sql = "SELECT * FROM bookings"
        all_bookings = SqlRunner.run(sql)
        return all_bookings.map { |booking| Booking.new(booking) }
    end

    def self.delete_all()
        sql = "DELETE FROM bookings"
        SqlRunner.run(sql)
    end

    def delete()
        sql = "DELETE FROM bookings WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def update()
        sql = "UPDATE bookings SET (member_id, yoga_session_id) = ($1, $2) WHERE id = $3"
        values = [@member_id, @yoga_session_id, @id]
        SqlRunner.run(sql, values)
    end

    def self.find_by_id(id)
        sql = "SELECT * FROM bookings WHERE id = $1"
        values = [id]
        found_booking = SqlRunner.run(sql, values).first
        return Booking.new(found_booking)
    end
end