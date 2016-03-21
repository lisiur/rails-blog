class AddAuthorToConsernTable < ActiveRecord::Migration
  def change
    add_column :admin_articles, :author_id, :integer
    add_column :admin_tags, :author_id, :integer
    add_column :admin_categories, :author_id, :integer
    add_column :admin_archives, :author_id, :integer
    add_column :admin_messages, :author_id, :integer
  end
end
