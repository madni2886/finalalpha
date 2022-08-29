class SearchController < ApplicationController
  def index
    @query=Article.page(params[:page]).per(10).ransack(params[:q])
    @post=@query.result

  end

end
