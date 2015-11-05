module InstagramDirectAPI
  class LastWeekMedia
    attr_reader :client, :user_id

    def initialize(client, user_id)
      @client, @user_id = client, user_id
    end

    def fetch
      result = []
      max_id = nil
      response = fetch_week_items(max_id)

      while response.next_max_id && !response.items.empty?
        result << response.items
        max_id = response.next_max_id
        response = fetch_week_items(max_id)
      end

      result.flatten(1)
    end

    def week_edge
      @edge ||= (Time.now - 7.days).to_i
    end

    protected

    def fetch_week_items(max_id)
      response = @client.media(user_id, { max_id: max_id })
      next_max_id = response.pagination.next_max_id rescue nil

      TarvitHelpers::HashPresenter.present(
          items: week_items(response.data),
          next_max_id: next_max_id,
      )
    end

    def week_items(items)
      items.select do |media_item|
        media_item.created_time.to_i > week_edge
      end
    end

  end
end
