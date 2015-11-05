module InstagramDirectAPI
  module LastWeekMedia
    class ForTag < Base

      protected

      def fetch_media_items(max_id)
        client.tag_media(id, { max_id: max_id })
      end
    end
  end
end
