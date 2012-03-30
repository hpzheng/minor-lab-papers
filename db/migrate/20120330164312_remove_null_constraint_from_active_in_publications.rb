class RemoveNullConstraintFromActiveInPublications < ActiveRecord::Migration
  def up
    execute "ALTER TABLE papers_publication " +
            "ALTER COLUMN active DROP not null;"
  end

  def down
  end
end
