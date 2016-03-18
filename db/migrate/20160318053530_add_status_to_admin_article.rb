class AddStatusToAdminArticle < ActiveRecord::Migration
  def change
    add_column :admin_articles, :status, :integer, :default => 1
  end
end
