class ChangeTypeUpdatedAtInPublication < ActiveRecord::Migration
  def up
    execute "ALTER TABLE papers_publication " +
            "ALTER COLUMN updated_at DROP not null;"
  end

  def down
  end
end
