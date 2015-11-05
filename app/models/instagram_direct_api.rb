module InstagramDirectAPI
  class Client
    attr_reader :client_id

    def initialize(client_id)
      @client_id = client_id
    end

    def search(object_type, query)
      request(search_url(object_type, query))
    end

    def user(id)
      request user_url(id)
    end

    protected

    def user_url(id)
      "https://api.instagram.com/v1/users/#{id}/?client_id=#{client_id}"
      #"https://api.instagram.com/v1/users/#{id}/media/recent/?client_id=#{client_id}"
    end

    def search_url(object_type, query)
      q = URI.encode(query)
      "https://api.instagram.com/v1/#{object_type}/search?q=#{q}&client_id=#{client_id}"
    end

    def request(url)
      uri = URI(url)
      raw_response = Net::HTTP.get(uri)
      response(raw_response)
    end

    def response(raw_response)
      hash = JSON.parse(raw_response)
      TarvitHelpers::HashPresenter.present(hash)
    end

  end
end
