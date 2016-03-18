class Admin::Article < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :tags

  attr_accessor :tag_names
  attr_accessor :category_ids

  before_save :add_categories
  before_update :add_categories
  before_save :add_tags
  before_update :add_tags

  def state
    return "已发布" if status == 1
    return "未发布" if status == 0
  end
  def add_categories
    categories.clear
    category_ids.each{|id| add_category(id)} if category_ids
  end

  def add_tags
    tags.clear
    tag_names.each {|t| add_tag(t)} if tag_names
  end

  private
  def add_tag(tagName)
    current_tag = Admin::Tag.find_by_name(tagName) || Admin::Tag.new(name:tagName)
    tags<<current_tag if current_tag.save
  end

  def add_category(categoryId)
    current_category = Admin::Category.find_by_id(categoryId)
    categories<<current_category if current_category
  end

end
