class Publication < ActiveRecord::Base

  attr_accessible :topic, :first_author_id, :second_author_id, :third_author_id,
                  :target_journal_id, :deadline, :pub_statuses_attributes,
                  :attachments_attributes, :responsible_person_id, 
                  :proofreader_id, :manuscripts_attributes

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
  belongs_to :proofreader,
             :class_name => "Author"
  belongs_to :responsible_person,
             :class_name => "Author"
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
  has_many   :manuscripts,
             :class_name => "Manuscript"
  accepts_nested_attributes_for :manuscripts,
                                :allow_destroy => true




  default_scope :order => 'updated_at DESC'

  accepted_pubs = %(SELECT publication_id FROM papers_publication_status_jcn
                      WHERE status_id = 11)
  waiting_for_w = %(SELECT publication_id FROM papers_publication_status_jcn
                      WHERE status_id IN (1,9))
  scope :active_publications, where("papers_publication.id NOT IN (SELECT publication_id FROM papers_publication_status_jcn
                      WHERE status_id = 11)") 
  scope :accepted_publications, where("id IN (SELECT publication_id FROM papers_publication_status_jcn
                      WHERE status_id = 11)") 
  scope :waiting_for_wladek, where("id IN (SELECT publication_id FROM papers_publication_status_jcn
                      WHERE status_id IN (1,9))")

  #validates :topic, :presence => true
  validates_presence_of :topic
  validates :first_author, :presence => true

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
    where("id IN (?)", active_pubs)
  end

  def last_update
    if !self.pub_statuses.empty?
      if self.updated_at < self.pub_statuses.last.updated_at
        return self.pub_statuses.last.updated_at
      else
        return self.updated_at
      end
    else
      return self.updated_at 
    end
  end
end
