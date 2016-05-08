class Api::ArticleController < ApiController
  before_action :check_user
  def index
    @article = Admin::Article.find_by_title(params[:title])
    if @article
      respond_to do |format|
        update_author_tags_categories
        if @article.update(title:params[:title],content:params[:content],article_type_id:params[:type])
          format.json { render nothing: true, status: 200, location: @article }
        else
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    else
      @article = Admin::Article.new(title:params[:title],content:params[:content],article_type_id:params[:type])
      respond_to do |format|
        add_author_tags_categories_archive
        if @article.save
          format.json { render nothing: true, status: 200, location: @article }
        else
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  private
    def check_user
      @author = Admin::Author.find_by_name(params[:name])
      if !(@author && @author.authenticate(params[:password]))
        return false
      end
    end

    def add_author_tags_categories_archive
      @article.author_id = @author.id
      @article.tag_names = params["tags"].split(',')
      category_ids = params["categories"].split(',').map{|name| @author.categories.find_by_name(name)}.compact
      @article.category_ids = category_ids.map{|cat| cat.id}
      archive = Admin::Archive.find_or_create_by(author_id:@author.id,year:Time.now.year,month:Time.now.month)
      @article.archive_id = archive.id
      @article.add_categories
      @article.add_tags(@author.id)
    end

    def update_author_tags_categories
      @article.tag_names = params["tags"].split(',')
      category_ids = params["categories"].split(',').map{|name| @author.categories.find_by_name(name)}.compact
      @article.category_ids = category_ids.map{|cat| cat.id}
      @article.add_categories
      @article.add_tags(@author.id)
    end
end
