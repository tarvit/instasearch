module InstagramDirectAPI
  class Client
    attr_reader :client_id

    def initialize(client_id)
      @client_id = client_id
    end

    def search(object_type, query)
      request search_url(object_type, query)
    end

    def user(id)
      request user_url(id)
    end

    def user_media(id, opts)
      request user_media_url(id, opts)
    end

    def tag(name)
      request tag_url(name)
    end

    def tag_media(id, opts)
      request tag_media_url(id, opts)
    end

    protected

    def user_media_url(id, opts)
      instagram_url("users/#{id}/media/recent", opts)
    end

    def user_url(id)
      instagram_url("users/#{id}")
    end

    def tag_url(name)
      instagram_url("tags/#{URI.encode(name)}")
    end

    def tag_media_url(name, opts)
      instagram_url("tags/#{URI.encode(name)}/media/recent", opts)
    end

    def search_url(object_type, query)
      instagram_url("#{object_type}/search", q: query)
    end

    def request(url)
      puts url
      uri = URI(url)
      raw_response = Net::HTTP.get(uri)
      response(raw_response)
    end

    def response(raw_response)
      hash = JSON.parse(raw_response)
      TarvitHelpers::HashPresenter.present(hash)
    end

    def options(opts)
      return nil if opts.empty?
      ?& + opts.to_a.map{ |(k, v)|
        [ k, URI.encode(v.to_s) ]*?=
      }.join(?&)
    end

    def instagram_url(action, opts={})
      "https://api.instagram.com/v1/#{ action }?client_id=#{ client_id }#{ options(opts) }"
    end

  end
end
