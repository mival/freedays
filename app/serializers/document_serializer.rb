class DocumentSerializer < ActiveModel::Serializer
  attributes :file_data, :url, :extension
end