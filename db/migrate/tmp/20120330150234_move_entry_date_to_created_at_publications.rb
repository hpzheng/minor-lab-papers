class MoveEntryDateToCreatedAtPublications < ActiveRecord::Migration
  def up
    Publication.all.each do |pub|
      pub.update_column(:created_at, pub.entry_date)
    end
  end

  def down
  end
end
