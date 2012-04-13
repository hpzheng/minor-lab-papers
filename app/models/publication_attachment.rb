class PublicationAttachment < ActiveRecord::Base

  mount_uploader :attachment, AttachmentUploader

  belongs_to :publication

  validates :publication_id, :presence => true

end
