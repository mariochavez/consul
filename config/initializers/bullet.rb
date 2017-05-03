if defined?(Bullet)
  Bullet.enable = true
  Bullet.bullet_logger = true

  if ENV['BULLET'].present?
    Bullet.rails_logger = true
    Bullet.add_footer = true
  end
end
