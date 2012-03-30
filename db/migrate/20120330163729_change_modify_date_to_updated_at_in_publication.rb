class ChangeModifyDateToUpdatedAtInPublication < ActiveRecord::Migration
  def up
    execute "ALTER TABLE papers_publication ALTER COLUMN modify_date TYPE timestamp without time zone"
    rename_column :papers_publication, :modify_date, :updated_at
  end

  def down
  end
end
