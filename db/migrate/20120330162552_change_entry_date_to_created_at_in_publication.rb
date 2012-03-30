class ChangeEntryDateToCreatedAtInPublication < ActiveRecord::Migration
  def up
    execute "ALTER TABLE papers_publication ALTER COLUMN entry_date TYPE timestamp without time zone"
    rename_column :papers_publication, :entry_date, :created_at
  end

  def down
  end
end
