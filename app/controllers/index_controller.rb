class IndexController < ApplicationController
  before_action :set_all_article_types

  private
  def set_all_article_types
    @all_article_types = Admin::ArticleType.all
  end
end
