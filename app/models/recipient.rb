class Recipient < ActiveRecord::Base
  has_many :gifts
  belongs_to :user

  def self.valid_params?(params)
   return !params[:name].empty?
  end

end
