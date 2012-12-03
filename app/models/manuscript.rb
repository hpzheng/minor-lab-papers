class Manuscript < ActiveRecord::Base

  attr_accessible :publication_id, :title, :version, :attachment, :comment,:manuscript

  default_scope :order => "updated_at DESC"
  default_scope :limit => "1"

  mount_uploader :manuscript, PublicationDocumentUploader

  belongs_to :publication
  has_one :document_type

  validates :publication_id, :presence => true
  validates :version, :presence => true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  validates :manuscript, :presence => true


end
