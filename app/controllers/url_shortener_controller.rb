class UrlShortenerController < ApplicationController
  def create
    url = JSON.parse(request.raw_post)['url']
    if url.present?
      render json: ShortenerHelper::Shortener.short_url(url)
    else
      render json: { error: 'Your url is empty' }, status: 400
    end
  end

  def redirect
    long_url = ShortenerHelper::Shortener.short_urls.key(params[:path])
    if long_url.present?
      response.content_type = 'application/json'
      response.status = 301
      response.location = long_url
      render json: { url: long_url }
    else
      render json: { error: 'Your short url does not exist' }, status: 400
    end
  end
end
