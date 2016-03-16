class AddAttributesToAdminCategories < ActiveRecord::Migration
  def change
    add_column :admin_categories, :supcategory_id, :integer
  end
end
