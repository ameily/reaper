class Attachment < ActiveRecord::Base
  belongs_to :soul
  validates :name, :customer, :category, presence: true
  has_attached_file :attachment
  #validates_attachment_presence :attachment
  #do_not_validate_attachment_file_type :attachment
  validates_with AttachmentPresenceValidator, :attributes => :attachment
  do_not_validate_attachment_file_type :attachment

  def attachment_url
    attachment.url()
  end
end
