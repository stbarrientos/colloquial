class InitialSchema < ActiveRecord::Migration
  def up

    create_table :articles do |t|
      t.string :title, null: false, limit: 255
      t.string :url, null: false, limit: 255
      t.timestamps
    end

    create_table :bookmarks do |t|
      t.references :articles, null: false
      t.references :users, null: false
      t.string :name, default: nil
      t.timestamps
    end

    create_table :tags do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :article_tags do |t|
      t.references :tags
      t.references :articles
      t.timestamps
    end

    create_table :publications do |t|
      t.string :name, null: false
      t.string :language, default: nil
      t.string :bias, default: nil
      t.timestamps
    end

    create_table :article_publications do |t|
      t.references :articles
      t.references :publications
      t.timestamps
    end

    create_table :countries do |t|
      t.string :name, null: false
      t.string :continent, default: nil
      t.string :region, default: nil
      t.string :crisis_level
      t.timestamps
    end

    create_table :country_publications do |t|
      t.references :countries
      t.references :publications
      t.timestamps
    end

    add_index :articles, :url, unique: true
    add_index :countries, :name, unique: true
    add_index :publications, :name, unique: true

  end

  def down
    drop_table(:articles) if table_exists? :articles
    drop_table(:bookmarks) if table_exists? :bookmarks
    drop_table(:tags) if table_exists? :tags
    drop_table(:article_tags) if table_exists? :article_tags
    drop_table(:publications) if table_exists? :publications
    drop_table(:article_publications) if table_exists? :article_publications
    drop_table(:countries) if table_exists? :countries
    drop_table(:country_publications) if table_exists? :country_publications
  end
end
