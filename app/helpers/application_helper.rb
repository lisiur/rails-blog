module ApplicationHelper
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
    text = text.gsub(labels,"\r\n```")
    markdown.render(text).html_safe
  end

  class HTMLwithCodeRay < Redcarpet::Render::HTML
    def block_code(code, language)
      language = "html" if language.nil?
      CodeRay.scan(code, language).div(:tab_width=>2)
    end
  end
end
