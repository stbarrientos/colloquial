class Article < ActiveRecord::Base

  has_many :bookmarks
  has_many :users, through: :bookmarks
  has_many :article_tags
  has_many :tags, through: :article_tags
  has_many :article_publications
  has_many :publications, through: :article_publications
  has_many :article_countries
  has_many :countries, through: :article_countries

end