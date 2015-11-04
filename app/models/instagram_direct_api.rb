module InstagramDirectAPI
  class Client
    attr_reader :client_id

    def initialize(client_id)
      @client_id = client_id
    end

    def search(object_type, query)
      request(search_url(object_type, query))
    end

    def search_url(object_type, query)
      q = URI.encode(query)
      "https://api.instagram.com/v1/#{object_type}/search?q=#{q}&client_id=#{client_id}"
    end

    protected

    def request(url)

    end

  end
end
