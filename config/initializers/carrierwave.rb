aws_credentials = Rails.application.credentials.aws

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    :provider => 'AWS',
    :aws_access_key_id =>     aws_credentials[:access_key_id],
    :aws_secret_access_key => aws_credentials[:secret_access_key],
    :region =>                'eu-west-2',
  }
  config.fog_directory  = 'rails7-blog'
end
