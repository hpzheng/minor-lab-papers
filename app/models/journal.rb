class Journal < ActiveRecord::Base

  set_primary_key "id"
  set_table_name "papers_journal"

  attr_accessible :journal_name, :journal_abbr, :url

  validates :journal_name, :presence => true
  validates :journal_abbr, :presence => true
  validates :url, :presence => true

  def self.journal_list
    Journal.select("id, journal_abbr").map {|x| [x.id, x.journal_abbr]}
  end



end
