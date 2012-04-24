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
  accepts_nested_attributes_for :pub_statuses,
                                :allow_destroy => true
  has_many   :statuses,
             :through => :pub_statuses
  has_many   :pub_refs,
             :class_name => "PubRefJcn"
  has_many   :referees,
             :through => :pub_refs
  accepts_nested_attributes_for :pub_refs,
                                :allow_destroy => true
  has_many   :attachments,
             :class_name => "PublicationAttachment"
  accepts_nested_attributes_for :attachments,
                                :allow_destroy => true



  default_scope :order => 'updated_at DESC'

  accepted_pubs = %(SELECT publication_id FROM papers_publication_status_jcn
                      WHERE status_id = 11)
  waiting_for_w = %(SELECT publication_id FROM papers_publication_status_jcn
                      WHERE status_id IN (1,9))
  scope :active_publications, where("id NOT IN (#{accepted_pubs})") 
  scope :accepted_publications, where("id IN (#{accepted_pubs})") 
  scope :waiting_for_wladek, where("id IN (#{waiting_for_w})")

  validates :topic, :presence => true
  validates :target_journal, :presence => true
  validates :first_author, :presence => true
  validates :deadline, :presence => true

  def author_list
    if self.third_author
      return "#{self.first_author.auth_name}, #{self.second_author.auth_name} and #{self.third_author.auth_name}"
    elsif self.second_author
      return "#{self.first_author.auth_name} and #{self.second_author.auth_name}"
    else
      return "#{self.first_author.auth_name}"
    end
  end

  def add_status(paper)
    self.pub_statuses.create!(:publication_id => paper.id)
  end

  def self.status_count
    active_pubs = Publication.all
    active_pubs = active_pubs.uniq
    where("id IN (#{active_pubs})")
  end
end
