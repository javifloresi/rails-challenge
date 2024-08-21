require 'net/http'
require 'uri'
require 'json'

class EmployeeService
  include APIConfig # credentials
  TOKEN_URL = "/api/v1/assignment/token/"
  EMPLOYEES_URL = "/api/v1/assignment/employee/list"

  def initialize
    @api_adapter = ApiAdapter.new(API_BASE_URL)
  end

  
  def fetch_and_store_employees
    token = fetch_token
    if token
      employees = fetch_employees(token)
      store_employees(employees) if employees
    end
  end

  private

  def fetch_token
    body = {
      "grant_type" => "password",
      "client_id" => CLIENT_ID,
      "client_secret" => CLIENT_SECRET,
      "username" => USERNAME,
      "password" => PASSWORD
    }
    response = @api_adapter.post(TOKEN_URL, body)
    response["access_token"]
  end

  def fetch_employees(token)
    headers = { "Authorization" => "Bearer #{token}" }
    @api_adapter = ApiAdapter.new(API_BASE_URL, headers)
    @api_adapter.get(EMPLOYEES_URL)
  end

  def store_employees(employees)
    employees.each do |employee_data|
      Employee.create(
        first_name: employee_data["first_name"],
        last_name: employee_data["last_name"],
        date_of_birth: employee_data["date_of_birth"],
        email: employee_data["email"],
        address: employee_data["address"],
        country: employee_data["country"],
        bio: employee_data["bio"],
        rating: employee_data["rating"]
      )
    end
  end
end
