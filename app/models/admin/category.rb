class Admin::Category < ActiveRecord::Base
  has_many :subcategories, class_name: "Admin::Category",
                           foreign_key: "supcategory_id"

  belongs_to :supcategory, class_name: "Admin::Category"

  has_many :articles
end
