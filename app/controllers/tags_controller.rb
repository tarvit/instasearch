class TagsController < ApplicationController

  def show
    http_request_call do
      tag_response = instagram_client.tag(tag_name)
      if success?(tag_response)
        show_tops(tag_response)
      else
        show_error(tag_response.meta.error_message)
      end
    end
  end

  protected

  def show_tops(tag_response)
    @tag = tag_response.data
    last_week_media = InstagramDirectAPI::LastWeekMedia::ForTag.new(instagram_client, tag_name).fetch
    @likes_top = InstagramMediaTop::LikesTop.new(last_week_media).list
    @comments_top = InstagramMediaTop::CommentsTop.new(last_week_media).list
  end

  def tag_name
    params[:id]
  end

end
