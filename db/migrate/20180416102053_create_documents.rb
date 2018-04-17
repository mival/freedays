class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.references :attachable, polymorphic: true
      t.jsonb :file_data
    end
  end
end
