class EmployeesController < ApplicationController
  def index
    if Employee.exists?
      @employees = Employee.all
    else
      redirect_to fetch_employees_path
    end
  end

  def fetch_employees
    begin
      service = EmployeeService.new
      service.fetch_and_store_employees
      redirect_to employees_path, notice: 'Employees fetched and stored successfully.'
    rescue StandardError => e
      redirect_to employees_path, alert: "Failed to fetch employees: #{e.message}"
    end
  end
end
