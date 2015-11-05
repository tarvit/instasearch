class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def success?(response)
    response.meta.code == 200
  end

  def http_request_call(&action)
    action.call
  rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, Errno::ECONNREFUSED, EOFError,
      Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => ex
    show_error(ex.message)
  end

  def show_error(message)
    @error = message
    render 'errors/show'
  end

  def instagram_client
    InstagramDirectAPI::Client.new(Rails.application.secrets.instagram_client_id)
  end

end
