class User < ApplicationRecord
  has_many :articles
  validates :username, presence: true, 
                       uniqueness: { case_sensitive: false }, 
                       length: { in: 3..25, too_short: "Username is too short!", too_long: "Username is too long!" }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    uniqueness: { case_sensitive: false }, 
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }
end