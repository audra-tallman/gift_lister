class Gift < ActiveRecord::Base
  belongs_to :recipient

  def self.valid_params?(params)
    return !params[:name].empty?
  end
end
