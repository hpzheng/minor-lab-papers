class CreateManuscripts < ActiveRecord::Migration
  def change
    create_table :manuscripts do |t|
      t.integer :publication_id
      t.string :title
      t.integer :version
      t.text :comment

      t.timestamps
    end
  end
end
