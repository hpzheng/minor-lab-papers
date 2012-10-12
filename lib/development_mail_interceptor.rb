class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject}"
    #message.to = "matthewwdemas+RailsInterceptor@gmail.com"
    message.to = "matt_d@iwonka.med.virginia.edu"
  end
end

