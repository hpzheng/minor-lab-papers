class Manuscript < ActiveRecord::Base

  attr_accessible :publication_id, :title, :version, :attachment, :comment

  mount_uploader :manuscript, PublicationDocumentUploader

  belongs_to :publication

  validates :publication_id, :presence => true
  validates :version, :presence => true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  validates :manuscript, :presence => true


end
