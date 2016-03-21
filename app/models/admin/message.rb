class Admin::Message < ActiveRecord::Base
  belongs_to :author
end
