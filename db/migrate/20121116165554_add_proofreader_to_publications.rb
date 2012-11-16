class AddProofreaderToPublications < ActiveRecord::Migration
  def change
    add_column :papers_publication, :proofreader_id, :integer
  end
end
