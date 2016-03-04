# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Article.delete_all
User.delete_all
Tag.delete_all
Country.delete_all
Bookmark.delete_all
ArticlePublication.delete_all
Publication.delete_all
CountryPublication.delete_all
ArticleTag.delete_all
ArticleCountry.delete_all
ArticlePublication.delete_all

users = User.create([
  { email: "sam@example.com", password: "password" },
  { email: "dimitri@example.com", password: "password" }
])

articles = Article.create([
  { title: "Google", url: "www.google.com" },
  { title: "Yahoo", url: "www.yahoo.com" }
])

bookmarks = Bookmark.create([
  { article_id: articles.first.id, user_id: users.first.id, name: "Google Bookmark" },
  { article_id: articles.last.id, user_id: users.last.id, name: "Yahoo Bookmark" }
])

tags = Tag.create([
  { name: "Happy" },
  { name: "Sad"},
])

article_tags = ArticleTag.create([
  { article_id: articles.first.id, tag_id: tags.first.id },
  { article_id: articles.last.id, tag_id: tags.last.id }
])

publications = Publication.create([
  { name: "Google", language: "English", bias: "American Left" },
  { name: "Yahoo", language: "English", bias: "American Right" }
])

article_publications = ArticlePublication.create([
  { article_id: articles.first.id, publication_id: publications.first.id },
  { article_id: articles.last.id, publication_id: publications.last.id }
])

countries = Country.create([
  { name: "USA", continent: "North America", region: "North America", crisis_level: 1 },
  { name: "Canada", continent: "North America", region: "North America", crisis_level: 1 }
])

article_countries = ArticleCountry.create([
  { article_id: articles.first.id, country_id: countries.first.id },
  { article_id: articles.last.id, country_id: countries.last.id }
])

country_publications = CountryPublication.create([
  { country_id: countries.first.id, publication_id: publications.first.id },
  { country_id: countries.last.id, publication_id: publications.last.id }
])




