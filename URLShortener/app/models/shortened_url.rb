class ShortenedUrl < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true

  #   Associations

  #   ==================================================
  def self.random_code
    random_code = SecureRandom.urlsafe_base64(16)
    until !ShortenedUrl.exists?(short_url: random_code)
      random_code = SecureRandom.urlsafe_base64(16)
    end
    random_code
  end
end
