class AddEditorToAdminArticles < ActiveRecord::Migration
  def change
    add_column :admin_articles, :editor, :integer, :default => 0
  end
end
