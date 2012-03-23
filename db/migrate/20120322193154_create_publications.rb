class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.integer :first_author_id
      t.integer :second_author_id
      t.integer :third_author_id
      t.integer :target_journal_id
      t.text :topic
      t.timestamp :entry_date
      t.timestamp :modify_date
      t.date :deadline
      t.boolean :active

      t.timestamps
    end
  end
end
