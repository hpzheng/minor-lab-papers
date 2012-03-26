class Status < ActiveRecord::Base

  set_primary_key "id"
  set_table_name "papers_status"

  def status_str
    self.status.gsub("_", " ")
  end

end
