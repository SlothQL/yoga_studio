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

end