class ArticlePublication < ActiveRecord::Base

  belongs_to :article
  belongs_to :publication

end
