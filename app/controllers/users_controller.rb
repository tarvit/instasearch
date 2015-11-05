class UsersController < ApplicationController

  def show
    http_request_call do
      user_response = instagram_client.user(params[:id])
      if success?(user_response)
        show_tops(user_response)
      else
        show_error(user_response.meta.error_message)
      end
    end
  end

  protected

  def show_tops(user_response)
    @user = user_response.data
    last_week_media = InstagramDirectAPI::LastWeekMedia::ForUser.new(instagram_client, params[:id]).fetch
    @likes_top = InstagramMediaTop::LikesTop.new(last_week_media).list
    @comments_top = InstagramMediaTop::CommentsTop.new(last_week_media).list
  end

end
