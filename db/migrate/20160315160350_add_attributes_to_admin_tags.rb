class AddAttributesToAdminTags < ActiveRecord::Migration
  def change
    add_column :admin_tags, :name, :string
  end
end
