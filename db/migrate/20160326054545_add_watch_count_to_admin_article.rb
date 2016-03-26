class AddWatchCountToAdminArticle < ActiveRecord::Migration
  def change
    add_column :admin_articles, :watch_count, :integer, :default => 0
  end
end
