require_relative('../db/sql_runner')

class YogaClass

    attr_reader :id
    attr_accessor :category, :title

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @category = options['category']
        @title = options['title']
    end

    def save()
        sql = "INSERT INTO yoga_classes (category, title)
        VALUES ($1, $2) RETURNING id"
        values = [@category, @title]
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
        sql = "UPDATE yoga_classes SET (category, title) =
        ($1, $2) WHERE id = $3"
        values = [@category, @title, @id]
        SqlRunner.run(sql, values)
    end

    def self.delete_all()
        sql = "DELETE FROM yoga_classes"
        SqlRunner.run(sql)
    end

    def self.find_by_category(category)
        sql = "SELECT * FROM yoga_classes WHERE category = $1"
        values = [category]
        found_class = SqlRunner.run(sql, values).first
        return YogaClass.new(found_class)
    end

end