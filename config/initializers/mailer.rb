Rails.application.configure do
  config.action_mailer.default_url_options = { host: Rails.application.secrets.server_name }
  config.action_mailer.asset_host = "#{Rails.env.production? ? 'https' : 'http'}://#{Rails.application.secrets.server_name}"
end
