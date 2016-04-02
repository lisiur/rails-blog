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
    weather_list = {
      "晴" => 'rain',
      "多云" => 'rain',
      "雪" => 'snow',
      "雨" => 'rain',
      '小雨' => 'rain',
      '中雨' => 'rain',
      '大雨' => 'rain'
    }
    api_key  = "732b40aadc7409a1349780c6fb7a55f3"
    uri = 'http://apis.baidu.com'
    ip = request.remote_ip

    conn = Faraday.new(:url => uri ) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    ip = '112.80.186.74'
    response_city = conn.get do |req|
      req.url '/apistore/iplookupservice/iplookup',:ip => ip
      req.headers['apikey'] = api_key
      req.options.timeout = 5           # open/read timeout in seconds
      req.options.open_timeout = 2      # connection open timeout in seconds
    end
    city_name = JSON.parse(response_city.body)['retData']["district"]

    # response_city_code = conn.get do |req|
    #   req.url '/apistore/weatherservice/cityname',:cityname => city_name
    #   req.headers['apikey'] = api_key
    #   req.options.timeout = 5           # open/read timeout in seconds
    #   req.options.open_timeout = 2      # connection open timeout in seconds
    # end
    # city_code = JSON.parse(response_city.body)["retData"][0]['area_id']

    if city_name
      response_weather = conn.get do |req|
        req.url '/apistore/weatherservice/cityname',:cityname => city_name
        req.headers['apikey'] = api_key
        req.options.timeout = 5           # open/read timeout in seconds
        req.options.open_timeout = 2      # connection open timeout in seconds
      end
      weather = JSON.parse(response_weather.body)["retData"]["weather"]
    end
    @true_ip = ip
    @true_city = city_name
    @true_weather = weather
    if weather_list[weather].nil?
      @weather = 'snow'
    else
      @weather = weather_list[weather]
    end
  end
end
