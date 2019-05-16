class User < ActiveRecord::Base
  has_secure_password
  has_many :recipients

  def self.valid_params?(params)
   return !params[:name].empty?
  end
end
