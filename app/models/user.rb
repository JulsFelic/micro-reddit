class User < ActiveRecord::Base
  has_many :posts
  before_save { email.downcase! }
  validates :username, length: { minimum: 4, maximum: 30 },
                       presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }
end
