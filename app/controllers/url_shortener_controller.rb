class UrlShortenerController < ApplicationController
  def create
    url = JSON.parse(request.raw_post)['url']
    ## todo: handle if url is empty
    render json: ShortenerHelper::Shortener.short_url(url)
  end

  def redirect
    long_url = ShortenerHelper::Shortener.short_urls.key(params[:path])
    response.content_type = 'application/json'
    response.status = 301
    response.location = long_url
    render json: { url: long_url }
  end
end
