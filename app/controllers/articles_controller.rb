class ArticlesController < ApplicationController

def index
  # if params[:search]
  #   @articles = Article.where("title LIKE ?","%" + params[:search] + "%")
  # else
  #
  #   SELECT * FROM Article WHERE title LIKE %oog%
  #   @articles = Article.all
  # end
  @articles = Article.search params[:search]
end

private
  def article_params
    pararms.require(:article).permit(:search_term)
  end
end
