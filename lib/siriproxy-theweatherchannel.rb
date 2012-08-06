require 'cora'
require 'siri_objects'
require 'rubyweather'

class SiriProxy::Plugin::TheWeatherChannel < SiriProxy::Plugin
  
  def initialize(config)
    @license_key = "4dae298fcfdd0dfb5f00f52b6e1b135f"#config['weatherKey']
  end
  
  listen_for /(?:The )?Weather Channel/i do
    service = Weather::Service.new
    service.partner_id = ""
    service.license_key = "#{@license_key}"
    locations = service.find_location("77379")#"#{location.poostalCode}")
    say locations
  end
end