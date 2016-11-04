CarrierWave.configure do |config|
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     'AKIAJRQOBL55GAKMQUKQ',
      aws_secret_access_key: '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',
      region:                'us-west-2'
  }
  config.fog_directory  = 'vested-world'
  config.fog_public     = true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
end