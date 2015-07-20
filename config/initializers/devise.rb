# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  # The secret key used by Devise. Devise uses this key to generate
  # random tokens. Changing this key will render invalid all existing
  # confirmation, reset password and unlock tokens in the database.
  # Devise will use the `secret_key_base` on Rails 4+ applications as its `secret_key`
  # by default. You can change it below and use your own secret key.
  # config.secret_key = '5c907f7f596309322980d12608a8a4e3254acd51bbe2498bd117da0d0d52ab823e461b339924bdbab060f5e142440323c36b5fa5a4b6e3b95c2d89049477563c'

  # ==> Mailer Configuration
  # Configure the e-mail address which will be shown in Devise::Mailer,
  # note that it will be overwritten if you use your own mailer class
  # with default "from" parameter.
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  # Configure the class responsible to send e-mails.
  # config.mailer = 'Devise::Mailer'

  # ==> ORM configuration
  # Load and configure the ORM. Supports :active_record (default) and
  # :mongoid (bson_ext recommended) by default. Other ORMs may be
  # available as additional gems.
  require 'devise/orm/active_record'

 
  config.case_insensitive_keys = [:email]

 
  config.strip_whitespace_keys = [:email]

 

 
  config.skip_session_storage = [:http_auth]

 
  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true

 
  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 8..72



  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  
end
