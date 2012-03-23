class PubStatusJcn < ActiveRecord::Base

  set_primary_key "id"
  set_table_name "papers_publication_status_jcn"

  belongs_to :status
  belongs_to :publication
  belongs_to :person_responsible,
             :class_name => "Author"

  def status_string
    status_str = self.status.status.gsub("_", " ")
    if self.person_responsible_id and status_str[-2,2] == "by"
      return "#{status_str} #{self.person_responsible.auth_name}"
    else
      return "#{status_str}"
    end
  end
  
  def descr
    if self.description
      return self.description
    else
      return "--"
    end
  end

end
