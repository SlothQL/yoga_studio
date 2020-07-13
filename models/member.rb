require_relative('../db/sql_runner')

class Member

    attr_reader :id
    attr_accessor :first_name, :last_name, :street, :postcode, :city, :country, :email, :phone, :start_membership

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
        @street = options['street']
        @postcode = options['postcode']
        @city = options['city']
        @country = options['country']
        @email = options['email']
        @phone = options['phone']
        @start_membership = options['start_membership']
    end

    def save()
        @start_membership = Time.now().strftime("%d/%m/%Y")
        sql = "INSERT INTO members (first_name, last_name, street, postcode, city, country, email, phone, start_membership)
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING id"
        values = [@first_name, @last_name, @street, @postcode, @city, @country, @email, @phone, @start_membership]
        new_member = SqlRunner.run(sql, values).first
        @id = new_member['id'].to_i
    end


    def full_name()
        return "#{@first_name} #{@last_name}"
    end

    def address()
        return "#{@street}, #{@postcode}, #{@city}, #{@country}"
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
        sql = "UPDATE members SET (first_name, last_name, street, postcode, city, country, email, phone) =
        ($1, $2, $3, $4, $5, $6, $7, $8) WHERE id = $9"
        values = [@first_name, @last_name, @street, @postcode, @city, @country, @email, @phone, @id]
        SqlRunner.run(sql, values)
    end


    def sessions()
        sql = "SELECT yoga_sessions.* FROM yoga_sessions
        INNER JOIN bookings ON bookings.yoga_session_id = yoga_sessions.id WHERE bookings.member_id = $1"
        values = [@id]
        all_sessions = SqlRunner.run(sql, values)
        return all_sessions.map { |s| YogaSession.new(s) }
    end

    def classes()
        sql = "SELECT yoga_classes.* FROM yoga_classes
        INNER JOIN yoga_sessions ON yoga_sessions.yoga_class_id = yoga_classes.id
        INNER JOIN bookings ON bookings.yoga_session_id = yoga_sessions.id WHERE bookings.member_id = $1"
        values = [@id]
        all_classes = SqlRunner.run(sql, values)
        return all_classes.map { |c| YogaClass.new(c) }
    end

    def delete()
        sql = "DELETE FROM members WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

end