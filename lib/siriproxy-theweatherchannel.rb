require 'cora'
require 'siri_objects'
require 'nokogiri'
require 'open-uri'

class SiriProxy::Plugin::TheWeatherChannel < SiriProxy::Plugin

  def initialize(config)
    
  end
  def getTemps(doc)
		weatherPage = Nokogiri::HTML(open(doc))
    temps = Array.new
    @temps = weatherPage.search('span').each do |item|
      temps << item['itemprop'] if !item['itemprop'].nil?
   end
   return temps
  end
  listen_for /(?:The )?Weather Channel/i do
    temps = getTemps("http://www.weather.com/weather/right-now/77379")#{postalCode}")
    say temps
  end
end