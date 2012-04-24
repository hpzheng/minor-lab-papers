class CreatePublicationAttachments < ActiveRecord::Migration
  def change
    create_table :publication_attachments do |t|
      t.string :attachment
      t.integer :version
      t.integer :publication_id
      t.text :comment

      t.timestamps
    end
  end
end
