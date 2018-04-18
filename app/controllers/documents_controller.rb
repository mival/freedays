class DocumentsController < ApplicationController

  def create
    @document = Document.new(document_params)
    @document.save()
    render_jsonapi(@document)
  end

  def update
    @document = Document.find(params[:id])
    @document.update(document_params)
    render_jsonapi(@document)
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    render_jsonapi(@udocument)
  end

  private

  def document_params
    jsonapi_params.slice(:file)
  end
end
