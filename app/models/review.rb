class Review < ActiveRecord::Base
  belongs_to :user_reviews
  belongs_to :restaurant
end
