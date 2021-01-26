class UrlShortenerController < ApplicationController
  def create
    url = JSON.parse(request.raw_post)['url']
    ## todo: handle if url is empty
    render json: { url: url, short_url: ShortenerHelper::Shortener.add_url(url) }
  end

  def redirect
    redirect_to ShortenerHelper::Shortener.short_urls.key(params[:path]), status: 301
  end
end
