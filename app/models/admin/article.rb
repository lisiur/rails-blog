class Admin::Article < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :tags
  belongs_to :article_type, :class_name => 'Admin::ArticleType'
  belongs_to :author
  belongs_to :archive

  attr_accessor :tag_names
  attr_accessor :category_ids

  validates :title,presence:true,uniqueness:true
  before_create :strip
  before_save :set_abstract

  def strip
    self.title = self.title.lstrip
  end

  def set_abstract
    labels = /(```[A-Za-z]*)|(``)|(`)|(^>+)|(\*\*)|(\[\^\d\])|(#+ )/
    self.abstract = self.content[0..300].gsub(labels,"")
  end

  def state
    return "已发布" if status == 1
    return "未发布" if status == 0
  end

  def add_categories
    categories.clear
    category_ids.each{|id| add_category(id)} if category_ids
  end

  def add_tags(author_id)
    tags.clear
    tag_names.each {|t| add_tag(t,author_id)} if tag_names
    tags = tags.uniq if tags
  end

  private
  def add_tag(tagName,author_id)
    current_tag = Admin::Tag.find_or_create_by(name:tagName,author_id:author_id)
    tags<<current_tag if current_tag.save
  end

  def add_category(categoryId)
    current_category = Admin::Category.find_by_id(categoryId)
    categories<<current_category if current_category
  end


end
