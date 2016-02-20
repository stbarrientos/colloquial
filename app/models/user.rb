class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookmarks
  has_many :articles, through: :bookmarks
  has_many :article_tags, through: :articles
  has_many :tags, through: :article_tags
end
