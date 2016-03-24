class Admin::Author < ActiveRecord::Base
  has_secure_password
  mount_uploader :avatar, Admin::AuthorAvatarUploader
  has_many :archives
  has_many :articles
  has_many :categories
  has_many :tags
  validates :name,presence: true,
                  length: { minimum: 2,maximum: 10 }
end
