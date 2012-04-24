class Referee < ActiveRecord::Base

  set_primary_key "id"
  set_table_name "papers_referee"

  has_many :pub_ref_jcns

  attr_accessible :firstname, :lastname, :email, :department, :organization

  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :email, :presence => true
  validates :organization, :presence => true

  def ref_name
    if !(self.lastname)
      return "(#{self.frequency[0]}) #{self.firstname}"
    else
      return "(#{self.frequency[0]}) Dr. #{self.firstname} #{self.lastname}"
    end
  end

  def name
    return "Dr. #{self.firstname} #{self.lastname}"
  end

  def frequency
    if self.pub_ref_jcns.count == 0
      return [self.pub_ref_jcns.count, ""]
    else
      return [self.pub_ref_jcns.count, self.pub_ref_jcns.last.updated_at.strftime("%d %b %Y")]
    end
  end
end
