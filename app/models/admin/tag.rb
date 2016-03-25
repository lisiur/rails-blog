class Admin::Tag < ActiveRecord::Base
  has_and_belongs_to_many :articles
  belongs_to :author
  validates :name, presence: true
  before_save :strip

  def strip
    self.name = self.name.lstrip
  end
end
