class AddAttributesToAdminArticles < ActiveRecord::Migration
  def change
    add_column :admin_articles, :title, :string
    add_column :admin_articles, :content, :text
    add_column :admin_articles, :category_id, :integer
    add_column :admin_articles, :tag_id, :integer
    add_column :admin_articles, :archive_id, :integer
  end
end
