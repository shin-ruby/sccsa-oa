class Resource < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
end
