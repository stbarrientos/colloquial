class Tag < ActiveRecord::Base
  has_many :article_tags
  has_many :articles, through: :article_tags
  has_many :article_publications, through: :articles
  has_many :publications, through: :article_publications
end
