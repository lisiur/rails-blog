class IndexController < ApplicationController
  before_action :set_all_article_types
  before_action :set_login_author
  before_action :set_webgl



  private
  def set_all_article_types
    @all_article_types = Admin::ArticleType.all
  end

  def set_login_author
    @login_author = Admin::Author.find_by_id(session[:author_id]) if session[:author_id]
  end

  def set_webgl
    unless session[:current_weather]
      api_key  = "732b40aadc7409a1349780c6fb7a55f3"
      uri = 'http://apis.baidu.com'
      ip = request.remote_ip

      conn = Faraday.new(:url => uri ) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end

      # ip = "112.80.186.74"
      response_city = conn.get do |req|
        req.url '/apistore/iplookupservice/iplookup',:ip => ip
        req.headers['apikey'] = api_key
        req.options.timeout = 5           # open/read timeout in seconds
        req.options.open_timeout = 2      # connection open timeout in seconds
      end
      begin
        city_name = JSON.parse(response_city.body)['retData']["city"]
        # district_name = JSON.parse(response_city.body)['retData']["district"]
      rescue
        city_name = ''
      end

      # response_city_list = conn.get do |req|
      #   req.url '/apistore/weatherservice/citylist',:cityname => city_name
      #   req.headers['apikey'] = api_key
      #   req.options.timeout = 5           # open/read timeout in seconds
      #   req.options.open_timeout = 2      # connection open timeout in seconds
      # end
      # city_list = JSON.parse(response_city_list.body)["retData"]

      response_weather = conn.get do |req|
        req.url '/apistore/weatherservice/cityname',:cityname => city_name
        req.headers['apikey'] = api_key
        req.options.timeout = 5           # open/read timeout in seconds
        req.options.open_timeout = 2      # connection open timeout in seconds
      end
      begin
        weather = JSON.parse(response_weather.body)["retData"]["weather"]
      rescue
        weather = nil
      end

      @true_ip = ip
      @true_city = city_name
      @true_weather = weather

      if !weather.nil?
        session[:current_weather] = 'rain' if weather.include?("雨")
        session[:current_weather] = 'snow' if weather.include?("雪")
      end
      session[:current_weather] = 'snow' if session[:current_weather].nil?
    end
  end
end
