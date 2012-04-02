class FixTimestampsForPubRefJcn < ActiveRecord::Migration
  def up
    execute "ALTER TABLE papers_publication_referee_jcn ALTER COLUMN entry_date TYPE timestamp without time zone"
    rename_column :papers_publication_referee_jcn, :entry_date, :created_at
    execute "ALTER TABLE papers_publication_referee_jcn " +
            "ALTER COLUMN created_at DROP not null;"
    execute "ALTER TABLE papers_publication_referee_jcn ALTER COLUMN modify_date TYPE timestamp without time zone"
    rename_column :papers_publication_referee_jcn, :modify_date, :updated_at
    execute "ALTER TABLE papers_publication_referee_jcn " +
            "ALTER COLUMN updated_at DROP not null;"
  end

  def down
  end
end
