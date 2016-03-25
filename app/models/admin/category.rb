class Admin::Category < ActiveRecord::Base
  has_many :subcategories, class_name: "Admin::Category",
                           foreign_key: "supcategory_id"

  belongs_to :supcategory, class_name: "Admin::Category"
  belongs_to :author

  has_and_belongs_to_many :articles

  validates :name, presence:true,uniqueness: true

  before_create :strip

  def strip
    self.name = self.name.lstrip
  end
end
