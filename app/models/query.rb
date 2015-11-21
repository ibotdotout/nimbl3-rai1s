require 'nokogiri'
require 'rest-client'

class GoogleSearchQuery

  def initialize(keyword)
    @keyword = keyword
  end

  def query
    base_url = "https://www.google.co.th"
    url = "#{base_url}/search?hl=en&num=10&start=0&q=#{@keyword}"
    begin
      response = RestClient.get(url)
    rescue RestClient::ExceptionWithResponse => err
      puts err.response
    end
    @page = Nokogiri::HTML(response.body, nil, 'UTF-8') if response
  end

  def page
    @page
  end

  def total_search_result
    @page ? @page.css('div#resultStats').text.match(/(\d+[,.])+\d+/) : 0
  end

  def total_adword
    css_path = 'div.ads-visurl cite'
    extract_green_url(css_path)
  end

  def top_adword
    @page ?  total_adword - right_adword : []
  end

  def right_adword
    css_path = '#rhs_block div.ads-visurl cite'
    extract_green_url(css_path)
  end

  def none_adword
    css_path = 'div.s cite'
    extract_green_url(css_path)
  end

  def total_link
    @page ? total_adword.length + none_adword.length : 0
  end

  private
  def extract_green_url(css_path)
    @page ? @page.css(css_path).map{ |item| item.text } : []
  end

end
