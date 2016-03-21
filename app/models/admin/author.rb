class Admin::Author < ActiveRecord::Base
  has_secure_password
  has_many :archives
  has_many :articles
  has_many :categories
  has_many :tags
end
