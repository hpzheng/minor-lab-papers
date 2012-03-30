class MoveEntryDateToCreatedAtPublication < ActiveRecord::Migration
  def up
    execute "ALTER TABLE papers_publication ALTER COLUMN entry_date TYPE timestamp without time zone"
  end

end
