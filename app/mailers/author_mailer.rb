class AuthorMailer < ActionMailer::Base
  default from: "matthewwdemas@gmail.com"

  def report(author)
    @author = author
    @greeting = "Hello"

    mail to: author.email, subject: "TEST EMAIL"
  end
end
