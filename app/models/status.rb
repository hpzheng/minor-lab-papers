class Status < ActiveRecord::Base

  set_primary_key "id"
  set_table_name "papers_status"

  def status_str
    self.status.gsub("_", " ")
  end

  def status_clr
    if (self.priority == 0)
      return "red"
      return "#FFAAAA"
    elsif (self.priority == 1)
      return "orange"
      return "#FFFFAA"
    elsif (self.priority == 4)
      return "green"
      return "#AAFFAA"
    else
      #return "#FFFFFF"
      return "black"
      return "#ffffe6"
    end
  end
end
