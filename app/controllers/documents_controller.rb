class DocumentsController < ApplicationController
  def index
    @documents = Document.all
    render json: @documents
  end
  def create
    @document = Document.new(document_params)
    @document.save()
    render json: @document
  end

  private

  def document_params
    jsonapi_params.slice(:file)
  end
end
