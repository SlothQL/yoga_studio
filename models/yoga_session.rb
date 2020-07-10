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

end