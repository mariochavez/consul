module Consul
  class Application < Rails::Application
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es
    config.i18n.available_locales = [:en, :es, :fr, "pt-BR"]
    config.i18n.fallbacks = {"fr" => "es", "pt-br" => "es"}

    # Add lib to the autoload path
    config.autoload_paths << Rails.root.join('lib')
    config.time_zone = 'Madrid'
    config.active_job.queue_adapter = :delayed_job

    # Consul specific custom overrides
    # Read more on documentation:
    # * English: https://github.com/consul/consul/blob/master/CUSTOMIZE_EN.md
    # * Spanish: https://github.com/consul/consul/blob/master/CUSTOMIZE_ES.md
    #
    config.autoload_paths << "#{Rails.root}/app/controllers/custom"
    config.autoload_paths << "#{Rails.root}/app/models/custom"
    config.paths['app/views'].unshift(Rails.root.join('app', 'views', 'custom'))
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', 'custom', '*.{rb,yml}')]
  end
end
