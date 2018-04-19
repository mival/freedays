class Document < ApplicationRecord
  include DocumentUploader::Attachment.new(:file)

  belongs_to :attachable, polymorphic: true, optional: true
end