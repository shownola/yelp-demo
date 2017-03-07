require 'fog/aws'
require 'carrierwave'

require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
     
    }
  
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end


CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider                 => 'AWS',
    :aws_access_key_id        => ENV["aws_access_key_id"],
    :aws_secret_access_key    => ENV["aws_secret_access_key"],
    :region                   => ENV['aws_region'],
  }
  config.fog_directory = ENV["fog_directory"]
end


