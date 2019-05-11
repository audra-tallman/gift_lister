class Recipient < ActiveRecord::Base
  has_many :gifts
  belongs_to :user
end
