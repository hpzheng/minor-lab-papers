class Referee < ActiveRecord::Base

  set_primary_key "id"
  set_table_name "papers_referee"

  def ref_name
    if !(self.lastname)
      return self.firstname
    else
      return "#{self.firstname.split[0]} #{self.lastname[0]}."
    end
  end

end
