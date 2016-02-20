class ArticleCountry < ActiveRecord::Base
  belongs_to :country
  belongs_to :article
end
