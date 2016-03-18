class ArticlesTags < ActiveRecord::Migration
  def change
    create_table :admin_articles_tags, id: false do |t|
      t.belongs_to :article
      t.belongs_to :tag
    end
  end
end
