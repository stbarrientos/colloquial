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

  def self.search(search_params)
    if search_params

      publications = search_params[:publication_id]
      tags = search_params[:tag_id]
      title = search_params[:article_title]

      # If only one of the parameters is filled, we will be fine using activerecord's
      # built in queries, otherwise we will have to go with a custom solution
      if title && !publications && !tags
        return where("title LIKE ?", "%#{title}%")
      elsif !title && publications && !tags
        return joins(:publications).where("publications.id IN (?)", publications.join(","))
      elsif !title && !publications && tags
        return joins(:tags).where("tags.id IN (?)", tags.join(","))
      end

      # If we got this far, it means we have to build our custom query.
      # We join all applicable tables and dynamically generate the where clause
      query = "
        SELECT a.id, a.title, a.url, t.name, p.name
        FROM articles as a
        LEFT JOIN article_tags ON a.id = article_tags.article_id
        LEFT JOIN tags as t ON t.id = article_tags.tag_id
        LEFT JOIN article_publications ON a.id = article_publications.article_id
        LEFT JOIN publications as p ON p.id = article_publications.article_id
        WHERE "
      where = []

      # Add to the where clause based on which params are present
      where << "a.title LIKE ?" if title
      where << "p.id IN (?)" if publications
      where << "t.id IN (?)" if tags

      query += where.join(" AND ")

      # Execute the query, providing substitutions based on which params are present
      if title && publications && tags
        return find_by_sql [query, "%#{title}%", tags.join(","), publications.join(",")]
      elsif title && publications
        return find_by_sql [query, "%#{title}%", publications.join(",")]
      elsif title && tags
        return find_by_sql [query, "%#{title}%", tags.join(",")]
      else
        return find_by_sql [query, tags.join(","), publications.join(",")]
      end

    else
      all
    end
  end

  def list_name
    "#{title} (#{url})"
  end
end
