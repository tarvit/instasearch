class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def success?(response)
    response.meta.code == 200
  end

  def instagram_client
    InstagramDirectAPI::Client.new(Rails.application.secrets.instagram_client_id)
  end

end
