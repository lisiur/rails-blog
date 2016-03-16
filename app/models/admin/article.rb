class Admin::Article < ActiveRecord::Base
  belongs_to :category
end
