class AddNamesToAdminCategories < ActiveRecord::Migration
  def change
    add_column :admin_categories, :name, :string
    add_column :admin_categories, :faved, :integer, :default => 0
  end
end
