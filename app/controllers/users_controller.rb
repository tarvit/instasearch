class UsersController < ApplicationController

  def show
    user_response = instagram_client.user(params[:id])
    if success?(user_response)
      @user = user_response.data
      last_week_media = InstagramDirectAPI::LastWeekMedia.new(instagram_client, params[:id]).fetch
      @likes_top = InstagramMediaTop::LikesTop.new(last_week_media, 10).list
      @comments_top = InstagramMediaTop::CommentsTop.new(last_week_media, 10).list
    else
      show_error(user_response.meta.error_message)
    end
  end

  protected

  def show_error(message)
    @error = message
    render 'errors/show'
  end

end
