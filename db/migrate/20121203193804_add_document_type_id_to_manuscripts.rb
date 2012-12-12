class AddDocumentTypeIdToManuscripts < ActiveRecord::Migration
  def change
    add_column :manuscripts, :document_type_id, :integer
  end
end
