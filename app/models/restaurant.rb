class Restaurant < ActiveRecord::Base
  
  mount_uploader :image, ImageUploader
  
  has_many :reviews
  
  validates :name, :address, :phone, :website, :image, presence: true
  validates :phone, format: { with: /\A\(\d{3}\) \d{3}-\d{4}\z/,
    message: "must be in the format (123) 345-7890" }
end
