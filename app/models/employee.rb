class Employee
    attr_accessor :first_name, :last_name, :email, :date_of_birth, :address, :country, :rating, :bio
  
    def initialize(first_name:, last_name:, email:, date_of_birth:, address:, country:, rating:, bio:)
      @first_name = first_name
      @last_name = last_name
      @email = email
      @date_of_birth = date_of_birth
      @address = address
      @country = country
      @rating = rating
      @bio = bio
    end
  end
  