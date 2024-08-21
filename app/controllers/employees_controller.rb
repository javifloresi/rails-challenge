class EmployeesController < ApplicationController
  def index
    service = ApiService.new
    adapter = EmployeeAdapter.new(service)
    @employees = adapter.fetch_employees
  end
end
