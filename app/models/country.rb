class Country < ActiveRecord::Base
  has_many :country_publications
  has_many :article_countries
  has_many :publications, through: :country_publications
  has_many :articles, through: :article_countries
  has_many :article_tags, through: :articles
  has_many :tags, through: :article_tags
end
