require 'net/http'
require 'json'

class ApiService
  include APIConfig # credentials

  def initialize
    @token = authenticate
  end

  def fetch_employees
    uri = URI("#{API_BASE_URL}/employee/list")
    request = Net::HTTP::Get.new(uri)
    request['Authorization'] = "Bearer #{@token}"

    response = send_request(uri, request)
    JSON.parse(response.body)
  end

  private

  def authenticate
    uri = URI("#{API_BASE_URL}/token/")
    request = Net::HTTP::Post.new(uri)
    request.content_type = 'application/json'
    request.body = {
      grant_type: 'password',
      client_id: CLIENT_ID,
      client_secret: CLIENT_SECRET,
      username: USERNAME,
      password: PASSWORD
    }.to_json

    response = send_request(uri, request)
    JSON.parse(response.body)['access_token']
  end

  def send_request(uri, request)
    Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end
  end
end
