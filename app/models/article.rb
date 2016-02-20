class Article < ActiveRecord::Base
  attr_accessor :search_term

  has_many :bookmarks
  has_many :users, through: :bookmarks
  has_many :article_tags
  has_many :tags, through: :article_tags
  has_many :article_publications
  has_many :publications, through: :article_publications
  has_many :article_countries
  has_many :countries, through: :article_countries

  def self.search(term)
    if term
      where("title LIKE ?","%" + term + "%")
    else
      all
    end
  end
end
