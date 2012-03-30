class ChangeTypeCreatedAtInPublication < ActiveRecord::Migration
  def up
    execute "ALTER TABLE papers_publication " +
            "ALTER COLUMN created_at DROP not null;"
  end

  def down
  end
end
