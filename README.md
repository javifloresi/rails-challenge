# README

## INSTALLATION

### Development
1. Install docker & docker-compose
2. docker-compose up
3. Go to http://localhost

### Production
1. docker build -f Dockerfile.prod -t javifloresi/rails-challenge .
2. docker run --env-file env -d -p 80:80 javifloresi/rails-challenge
3. Go to http://localhost


## PROJECT DESCRIPTION
https://www.loom.com/share/cd416823d26542258adcc96931ed8df5


## CHALLENGE RELATED FILES
1. config/routes.rb
2. app/controllers/employees_controller.rb
3. app/adapters/employee_adapter.rb
4. app/services/api_service.rb
5. app/models/employee.rb
6. app/views/employees/index.html.erb
7. config/initializers/api_config.rb
8. env
9. Dockerfile
10. docker-compose.yml
11. Dockerfile.prod




