class Referee < ActiveRecord::Base

  set_primary_key "id"
  set_table_name "papers_referee"

  attr_accessible :firstname, :lastname, :email, :department, :organization

  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :email, :presence => true,
            :uniqueness => true
  validates :organization, :presence => true


  def ref_name
    if !(self.lastname)
      return self.firstname
    else
      return "#{self.firstname.first}. #{self.lastname}"
    end
  end

  def name
    return "Dr. #{self.firstname} #{self.lastname}"
  end
end
