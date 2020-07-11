require_relative('../db/sql_runner')

class YogaClass

    attr_reader :id
    attr_accessor :category, :title, :duration

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @category = options['category']
        @title = options['title']
        @duration = options['duration']
    end

    def save()
        sql = "INSERT INTO yoga_classes (category, title, duration)
        VALUES ($1, $2, $3) RETURNING id"
        values = [@category, @title, @duration]
        new_yoga_class = SqlRunner.run(sql, values).first
        @id = new_yoga_class['id'].to_i
    end

    def self.all()
        sql = "SELECT * FROM yoga_classes"
        all_classes = SqlRunner.run(sql)
        return all_classes.map { |yoga_class| YogaClass.new(yoga_class)}
    end

    def self.find_by_id(id)
        sql = "SELECT * FROM yoga_classes WHERE id = $1"
        values = [id]
        found_class = SqlRunner.run(sql, values).first
        return YogaClass.new(found_class)
    end

    def update()
        sql = "UPDATE yoga_classes SET (category, title, duration) =
        ($1, $2, $3) WHERE id = $4"
        values = [@category, @title, @duration, @id]
        SqlRunner.run(sql, values)
    end

    def self.delete_all()
        sql = "DELETE FROM yoga_classes"
        SqlRunner.run(sql)
    end

end