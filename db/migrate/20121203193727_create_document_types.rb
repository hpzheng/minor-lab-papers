class CreateDocumentTypes < ActiveRecord::Migration
  def change
    create_table :document_types do |t|
      t.string :doc_type
      t.text :comment

      t.timestamps
    end
  end
end
