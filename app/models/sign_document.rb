class SignDocument < ActiveRecord::Base
	belongs_to :documentable, polymorphic: true
	mount_uploader :document, SignDocumentUploader
end
