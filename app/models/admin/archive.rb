class Admin::Archive < ActiveRecord::Base
  belongs_to :author
  has_many :articles
end
