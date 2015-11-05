class SearchController < ApplicationController

  def index; end

  def query
    if search_string.empty?
      @tags, @users = [], []
      return
    end
    @tags = instagram_client.search(:tags, search_string).data
    @users = instagram_client.search(:users, search_string).data
  end

  protected

  def search_string
    @search_string ||= params[:instagram][:query].to_s
  end

end
