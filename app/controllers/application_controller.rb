class ApplicationController < ActionController::API

  def api_url(object)
    url_for([:api, object])
  end
end