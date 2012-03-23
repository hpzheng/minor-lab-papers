class Publication < ActiveRecord::Base

  set_primary_key "id"
  set_table_name "papers_publication"

  belongs_to :first_author,
             :class_name => "Author"
  belongs_to :second_author,
             :class_name => "Author"
  belongs_to :third_author,
             :class_name => "Author"
  belongs_to :target_journal,
             :class_name => "Journal"
  has_many   :pub_statuses,
             :class_name => "PubStatusJcn"
  has_many   :statuses,
             :through => :pub_statuses
  has_many   :pub_refs,
             :class_name => "PubRefJcn"
  has_many   :referees,
             :through => :pub_refs

  default_scope :order => 'modify_date DESC'

  def author_list
    if self.second_author
      return "#{self.first_author.auth_name} and #{self.second_author.auth_name}"
    elsif self.third_author
      return "#{self.first_author.auth_name}, #{self.second_author.auth_name} and #{self.third_author.auth_name}"
    else
      return "#{self.first_author.auth_name}"
    end
  end
end
