class PublicationAttachment < ActiveRecord::Base

  mount_uploader :attachment, AttachmentUploader

  belongs_to :publication

  validates :publication_id, :presence => true
  validates :version, :presence => true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }

  default_scope :order => 'updated_at DESC'

  def file_name
    return self.attachment.to_s.split('/').last
  end
end
