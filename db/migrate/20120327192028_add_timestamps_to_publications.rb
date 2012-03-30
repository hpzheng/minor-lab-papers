class AddTimestampsToPublications < ActiveRecord::Migration
  def change
    add_column :papers_publication, :created_at, :datetime
    add_column :papers_publication, :updated_at, :datetime
  end
end
