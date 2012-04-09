class PubStatusJcn < ActiveRecord::Base

  set_primary_key "id"
  set_table_name "papers_publication_status_jcn"
  
  attr_accessible :status_id, :due_date, :description, :person_responsible_id

  belongs_to :status
  belongs_to :publication
  belongs_to :person_responsible,
             :class_name => "Author"

  validates :status_id, :presence => true


  def status_string
    status_str = self.status.status_str
    if self.person_responsible_id and status_str[-2,2] == "by"
      return "#{status_str} #{self.person_responsible.auth_name}"
    elsif self.person_responsible_id
      return "#{status_str} (#{self.person_responsible.auth_name})"
    else
      return "#{status_str}"
    end
  end
  
  def status_color
    self.status.status_clr
  end

  def descr
    if self.description.empty?
      return "--"
    else
      return self.description
    end
  end

end
