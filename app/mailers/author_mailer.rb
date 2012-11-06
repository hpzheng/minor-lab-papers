class AuthorMailer < ActionMailer::Base
  default :from => "milapa@iwonka.med.virginia.edu"

  def report(author)
    @author = author
    @greeting = "Hello"

    mail :to => author.email, :subject => "TEST EMAIL"
  end
end
