class Admin::MdtoolsController < AdminController
  def markdown(text)
    options = {
        :autolink => true,
        :space_after_headers => true,
        :fenced_code_blocks => true,
        :no_intra_emphasis => true,
        :hard_wrap => true,
        :strikethrough =>true
    }
    markdown = Redcarpet::Markdown.new(HTMLwithCodeRay,options)
    labels = /```[A-Za-z]+/
    text = text.gsub(labels,"\r\n```") if text
    markdown.render(text).html_safe
  end

  class HTMLwithCodeRay < Redcarpet::Render::HTML
    def block_code(code, language)
      language = "html" if language.nil?
      CodeRay.scan(code, language).div(:tab_width=>2)
    end
  end
  
  def preview
    @preview_text = markdown params[:text]
    respond_to do |format|
      if @preview_text
        format.js {}
        format.json { render json: @preview_text  , status: :previewed, location: @preview_text }
      else
        format.json { render json: @preview_text, status: :unprocessable_entity }
      end
    end
  end
end
