class ArticlesController < ApplicationController

  def index
    @bookmarks = current_user.bookmarks if @user = current_user
    @publications = Publication.all
    @articles = Article.search search_params
    @tags = Tag.all
  end

  def advanced_search
    @message = greeting
  end

  private

  def article_params
    pararms.require(:article).permit(:search_term)
  end

  def search_params
    if params[:article_title] || params[:tag_id] || params[:publication_id]
      {
        article_title: params[:article_title],
        tag_id: params[:tag_id],
        publication_id: params[:publication_id]
      }
    end
  end

end



