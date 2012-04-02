class Author < ActiveRecord::Base

  set_primary_key "id"
  set_table_name "papers_author"

  default_scope :order => 'firstname'

  def auth_name
    if self.lastname.nil? || self.lastname.empty? || self.lastname == " "
      return "#{self.firstname}"
    else
      return "#{self.firstname.split[0]} #{self.lastname[0]}."
    end
  end

end