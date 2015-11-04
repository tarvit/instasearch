class SearchController < ApplicationController

  def index; end

  def query
    @search_string = params[:instagram][:query]
  end

end
