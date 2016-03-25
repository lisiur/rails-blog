class AddAbstractToAdminArticle < ActiveRecord::Migration
  def change
    add_column :admin_articles, :abstract, :text
  end
end
