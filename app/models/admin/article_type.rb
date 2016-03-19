class Admin::ArticleType < ActiveRecord::Base
  has_many :articles
  mount_uploader :img, Admin::ArticleTypeImgUploader
end
