class SearchController < ApplicationController
  def index
    @query=Article.ransack(params[:q])
    @post=@query.result
  end

end
