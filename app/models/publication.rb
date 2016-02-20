class Publication < ActiveRecord::Base
  has_many :country_publications
  has_many :article_publications
  has_many :countries, through: :country_publications
  has_many :articles, through: :article_publications
end
