class AddManuscriptToManuscripts < ActiveRecord::Migration
  def change
    add_column :manuscripts, :manuscript, :string
  end
end
