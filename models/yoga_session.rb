require_relative('../db/sql_runner')

class YogaSession

    attr_reader :id
    attr_accessor :yoga_class_id, :wday, :schedule

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @yoga_class_id = options['yoga_class_id'].to_i
        @wday = options['wday']
        @schedule = options['schedule']
    end

    def save()
        sql = "INSERT INTO yoga_sessions (yoga_class_id, wday, schedule)
        VALUES ($1, $2, $3) RETURNING id"
        values = [@yoga_class_id, @wday, @schedule]
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
        sql = "UPDATE yoga_sessions SET (yoga_class_id, wday, schedule) =
        ($1, $2, $3) WHERE id = $4"
        values = [@yoga_class_id, @wday, @schedule, @id]
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

end