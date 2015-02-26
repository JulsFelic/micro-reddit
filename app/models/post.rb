class Post < ActiveRecord::Base
  belongs_to :user

  validates :link_url, presence: true
  validates :title, presence: true, length: { minimum: 6, maximum: 200 },
                    uniqueness: true
  validates :user_id, presence: true
end
