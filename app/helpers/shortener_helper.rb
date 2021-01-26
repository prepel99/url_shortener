require 'securerandom'

module ShortenerHelper
  class Shortener
    @@short_urls = {}

    def self.short_url(url)
      formatted_url = handle_format(url)
      @@short_urls[formatted_url] = SecureRandom.alphanumeric(6)
      { url: formatted_url, short_url: @@short_urls[formatted_url] }
    end

    def self.short_urls
      @@short_urls
    end

    private

      def self.handle_format(url)
        return url if url.include?('http://') || url.include?('https://')

        'http://' + url
      end
  end
end
