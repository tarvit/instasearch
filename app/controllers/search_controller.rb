class SearchController < ApplicationController

  def index; end

  def query
    @search_string = params[:instagram][:query]
    @tags = instagram_client.search(:tags, @search_string).data
    @users = instagram_client.search(:users, @search_string).data
  end

  def user
    @user = instagram_client.user(params[:id]).data
  end

end
