require_relative('../db/sql_runner')

class Member

    attr_reader :id
    attr_accessor :title, :first_name, :last_name, :start_membership

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @title = options['title']
        @first_name = options['first_name']
        @last_name = options['last_name']
        @start_membership = options['start_membership']
    end

    def save()
        sql = "INSERT INTO members (title, first_name, last_name, start_membership)
        VALUES ($1, $2, $3, $4) RETURNING id"
        values = [@title, @first_name, @last_name, @start_membership]
        new_member = SqlRunner.run(sql, values).first
        @id = new_member['id'].to_i
    end

    def full_name()
        return "#{@first_name} #{@last_name}"
    end

    def self.all()
        sql = "SELECT * FROM members"
        all_members = SqlRunner.run(sql)
        return all_members.map { |member| Member.new(member)}
    end

    def self.find_by_id(id)
        sql = "SELECT * FROM members WHERE id = $1"
        values = [id]
        found_member = SqlRunner.run(sql, values).first
        return Member.new(found_member)
    end

    def self.delete_all
        sql = "DELETE FROM members"
        SqlRunner.run(sql)
    end

    def update()
        sql = "UPDATE members SET (title, first_name, last_name, start_membership) =
        ($1, $2, $3, $4) WHERE id = $5"
        values = [@title, @first_name, @last_name, @start_membership, @id]
        SqlRunner.run(sql, values)
    end

end