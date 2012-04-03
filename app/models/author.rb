class Author < ActiveRecord::Base

  set_primary_key "id"
  set_table_name "papers_author"

  attr_accessible :firstname, :lastname, :email, :phone, :skype

  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :email, :presence => true

  default_scope :order => 'firstname'

  def auth_name
    if self.lastname.nil? || self.lastname.empty? || self.lastname == " "
      return "#{self.firstname}"
    else
      return "#{self.firstname.first}. #{self.lastname}"
    end
  end

end
