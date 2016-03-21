class AddAttributesToAdminArchives < ActiveRecord::Migration
  def change
    add_column :admin_archives, :year, :integer
    add_column :admin_archives, :month, :integer
  end
end
