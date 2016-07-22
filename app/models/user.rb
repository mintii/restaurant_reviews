class User < ActiveRecord::Base
  include BCrypt

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :restaurants
  has_many :user_reviews
  has_many :reviews, through: :user_reviews

  def password
    @password ||=Password.new(hash_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hash_password = @password
  end

  def authenticate(text_password)
    self.password == text_password
  end

  def has_reviewed?(restaurant_id)
    checking_reviews = self.reviews.map do |review|
              review.restaurant_id == restaurant_id
            end
    checking_reviews.include?(true)
  end

end
