class GalleryController < ApplicationController
  def index
    @album_hash = {}
    image_shack_images.each do |image|
      image_hash = {}
      direct_link = image['direct_link']
      image_hash[:src] = direct_link
      image_hash[:description] = image['description']
      image_hash[:thumb] = thumbnail(direct_link)
      album = image['album']
      if @album_hash.has_key?(album['id'])
        @album_hash[album['id']][:images] << image_hash
      else
        @album_hash[album['id']] = { name: album['title'], images: [] }
        @album_hash[album['id']][:images] << image_hash
      end
    end
  end

  private

  def image_shack_images
    result = image_shack_api_call("#{ENV['image_shack_url']}/images")
    result['images'] unless result.nil?
  end

  def thumbnail(direct_link)
    parts = direct_link.split(".")
    length = parts.length
    parts.insert(length - 1, 'th').join('.')
  end

  def image_shack_api_call(url, type = :get, params = {})
    c = Curl::Easy.new
    c.url = "#{url}?#{Curl::postalize(params)}"
    c.method type
    c.ssl_verify_peer = false
    c.perform
    c.response_code == 200 ? JSON.parse(c.body)['result'] : nil
  end
end
