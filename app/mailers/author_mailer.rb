class AuthorMailer < ActionMailer::Base
  default :from => "manuscript-db@iwonka.med.virginia.edu",
          :reply_to => 'matt_d@iwonka.med.virginia.edu'

  def report(author)
    @author = author
    if @author.email == 'wladek@iwonka.med.virginia.edu'
      @intro = "Dear Wladek,"
      @greeting = "Here is a snapshot of papers which require your attention:"
      @outro1 = nil
      @outro2 = nil
    else
      @intro = "Dear Dr. #{@author.lastname},"
      @greeting = "Here is a snapshot of the papers which you are involved with:"
      @outro1 = "If any of this information is not correct, please update the site accordingly."
      @outro2 = "If you have any comments, concerns or questions, please contact either matt_d@iwonka.med.virginia.edu or dust@iwonka.med.virginia.edu."
    end

    mail :to => author.email, :subject => "Manuscript DB Report"
  end
end
