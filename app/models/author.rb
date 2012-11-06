class Author < ActiveRecord::Base

  set_primary_key "id"
  set_table_name "papers_author"

  attr_accessible :firstname, :lastname, :email, :phone, :skype

  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :email, :presence => true

  default_scope :order => 'firstname'
  scope :minor_lab_members, where("email LIKE '%iwonka.med.virginia.edu'") 

  has_many :statuses, :foreign_key => "person_responsible_id",
                                     :class_name => "PubStatusJcn"
  has_many :contrib_papers, through: :statuses,
                            #foreign_key: "publication_id",
                            primary_key: "publication_id",
                            class_name: "Publication",
                            source: :publication
  has_many :first_auth_papers, :foreign_key => "first_author_id",
                               :class_name => "Publication"
  has_many :second_auth_papers, :foreign_key => "second_author_id",
                               :class_name => "Publication"
  has_many :third_auth_papers, :foreign_key => "third_author_id",
                               :class_name => "Publication"

  def auth_name
    if self.lastname.nil? || self.lastname.empty? || self.lastname == " "
      return "#{self.firstname}"
    else
      return "#{self.firstname.first}. #{self.lastname}"
    end
  end

  def papers
    if self.email == 'wladek@iwonka.med.virginia.edu'
      all_papers = Publication.waiting_for_wladek
    else
      all_papers = Array.new
    end
    all_papers = first_auth_papers.active_publications +
                 second_auth_papers.active_publications +
                 third_auth_papers.active_publications +
                 contrib_papers.active_publications
    all_papers.uniq!
    return all_papers
  end

=begin
 - list of papers of which person is author
 - list of statuses with deadlines
=end

  def self.weekly_report
    @user = Author.minor_lab_members
    @user.each do |u|
      AuthorMailer.report(u).deliver
    end
  end
end
