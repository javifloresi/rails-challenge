class ApiAdapter
    def initialize(base_url, headers = {})
      @base_url = base_url
      @headers = headers
    end
  
    def post(endpoint, body = {})
      request(:post, endpoint, body)
    end
  
    def get(endpoint)
      request(:get, endpoint)
    end
  
    private
  
    def request(method, endpoint, body = {})
      uri = URI.join(@base_url, endpoint)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
  
      request = case method
      when :post
        Net::HTTP::Post.new(uri, @headers)
      when :get
        Net::HTTP::Get.new(uri, @headers)
      end
  
      request['Content-Type'] = 'application/json'
      request.body = JSON.dump(body) if method == :post
  
      response = http.request(request)
      JSON.parse(response.body)
    rescue StandardError => e
      puts "Error during API request: #{e.message}"
      nil
    end
  end
  