#ActionMailer::Base.smtp_settings = {
#  :address              => "smtp.gmail.com",
#  :port                 => 587,
#  :domain               => "gmail.com",
#  :user_name            => "matthewwdemas@gmail.com",
#  :password             => "MWDv1nd4lo0",
#  :authentication       => "plain",
#  :enable_starttls_auto => true
#}
#
#ActionMailer::Base.default_url_options[:host] = "localhost:3000"
#require 'development_mail_interceptor'
## switch to ActionMailer::j
#Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
