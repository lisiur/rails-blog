class AddAttibutesToAdminAuthor < ActiveRecord::Migration
  def change
    add_column :admin_authors, :name, :string
    add_column :admin_authors, :password_digest, :string
    add_column :admin_authors, :email, :string
    add_column :admin_authors, :avatar, :string
  end
end
