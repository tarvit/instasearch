module InstagramDirectAPI
  module LastWeekMedia
    class ForUser < Base

      protected

      def fetch_media_items(max_id)
        client.user_media(id, { max_id: max_id })
      end
    end
  end
end
