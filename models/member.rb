require_relative('../db/sql_runner')

class Member

    attr_reader :id, :start_membership
    attr_accessor :title, :first_name, :last_name

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @title = options['title']
        @first_name = options['first_name']
        @last_name = options['last_name']
        @start_membership = options['start_membership']
    end

end