class UrlShortenerController < ApplicationController
  def create
    url = JSON.parse(request.raw_post)['url']
    ## todo: handle if url is empty
    render json: { url: url, short_url: ShortenerHelper::Shortener.add_url(url) }
  end

  def redirect; end
end