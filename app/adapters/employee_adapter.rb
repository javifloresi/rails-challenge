class EmployeeAdapter
  def initialize(service)
    @service = service
  end

  def fetch_employees
    @service.fetch_employees.map do |data|
      Employee.new(
        first_name: data['first_name'],
        last_name: data['last_name'],
        email: data['email'],
        date_of_birth: data['date_of_birth'],
        address: data['address'],
        country: data['country'],
        rating: data['rating'],
        bio: data['bio']
      )
    end
  end
end
