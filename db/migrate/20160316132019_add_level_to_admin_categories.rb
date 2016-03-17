class AddLevelToAdminCategories < ActiveRecord::Migration
  def change
    add_column :admin_categories, :level, :integer, :default => 0
  end
end
