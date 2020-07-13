require_relative('../db/sql_runner')
require_relative('./yoga_class')

class YogaSession

    attr_reader :id
    attr_accessor :yoga_class_id, :wday, :schedule, :instructor

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @yoga_class_id = options['yoga_class_id'].to_i
        @wday = options['wday']
        @schedule = options['schedule']
        @instructor = options['instructor']
    end

    def save()
        sql = "INSERT INTO yoga_sessions (yoga_class_id, wday, schedule, instructor)
        VALUES ($1, $2, $3, $4) RETURNING id"
        values = [@yoga_class_id, @wday, @schedule, @instructor]
        new_session = SqlRunner.run(sql, values).first
        @id = new_session['id'].to_i
    end

    def self.all()
        sql = "SELECT * FROM yoga_sessions"
        all_sessions = SqlRunner.run(sql)
        return all_sessions.map { |s| YogaSession.new(s) }
    end

    def self.find_by_id(id)
        sql = "SELECT * FROM yoga_sessions WHERE id = $1"
        values = [id]
        found_session = SqlRunner.run(sql, values).first
        return YogaSession.new(found_session)
    end

    def update()
        sql = "UPDATE yoga_sessions SET (yoga_class_id, wday, schedule, instructor) =
        ($1, $2, $3, $4) WHERE id = $5"
        values = [@yoga_class_id, @wday, @schedule, @instructor, @id]
        SqlRunner.run(sql, values)
    end

    def self.delete_all()
        sql = "DELETE FROM yoga_sessions"
        SqlRunner.run(sql)
    end

    def yoga_class()
        sql = "SELECT * FROM yoga_classes WHERE id = $1"
        values = [@yoga_class_id]
        class_data = SqlRunner.run(sql, values).first
        return YogaClass.new(class_data)
    end

    def self.create_new_class(options)
        new_class = YogaClass.new(options)
        new_class.save()
        @yoga_class_id = new_class.id
    end

    def members()
        sql = "SELECT members.* FROM members
        INNER JOIN bookings ON bookings.member_id = members.id WHERE bookings.yoga_session_id = $1"
        values = [@id]
        all_members = SqlRunner.run(sql, values)
        return all_members.map { |member| Member.new(member) }
    end

    def delete()
        sql = "DELETE FROM yoga_sessions WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

end