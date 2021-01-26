require 'securerandom'

module ShortenerHelper
  class Shortener
    @@short_urls = {}

    def self.add_url(url)
      @@short_urls[url] = SecureRandom.alphanumeric(6)
    end

    def self.short_urls
      @@short_urls
    end
  end
end
