

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider              => 'AWS',
    :aws_access_key_id     => "#{ENV['AKIAILYDECIDQMMKDKDA']}",
    :aws_secret_access_key => "#{ENV['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']}",
    :region                => "#{ENV['us-east-2']}",
    :path_style            => true
  }

  config.fog_directory =  "#{ENV['groundupconstruction']}"
  config.cache_dir     = "#{Rails.root}/tmp/uploads"   # For Heroku
end