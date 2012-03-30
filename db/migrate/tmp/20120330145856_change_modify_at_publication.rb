class ChangeModifyAtPublication < ActiveRecord::Migration
  def up
    execute "ALTER TABLE papers_publication ALTER COLUMN modify_date TYPE timestamp without time zone"
    Publication.all.each do |pub|
      pub.update_attributes!(:updated_at => pub.modify_date)
    end
  end

  def down
  end
end
