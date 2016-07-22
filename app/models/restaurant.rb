class Restaurant < ActiveRecord::Base

  validates :name, :cuisine, :address, :city, :state, :zipcode, presence: true

  belongs_to :user
  has_many :reviews

end
