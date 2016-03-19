class AddTypeToAdminArticles < ActiveRecord::Migration
  def change
    add_column :admin_articles, :article_type_id, :integer
  end
end
