class AddGlyphiconToAdminArticleTypes < ActiveRecord::Migration
  def change
    add_column :admin_article_types, :glyphicon, :string
  end
end
