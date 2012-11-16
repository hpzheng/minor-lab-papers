class AddResponsiblePersonToPapersPublication < ActiveRecord::Migration
  def up
    add_column :papers_publication, :responsible_person_id, :integer
    Publication.all.each do |pub|
      pub.update_column( :responsible_person_id, pub.first_author_id )
    end
  end
  def down
    remove_column :papers_publication, :responsible_person_id
  end
end
