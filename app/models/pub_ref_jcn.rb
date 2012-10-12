class PubRefJcn < ActiveRecord::Base

  attr_accessible :publication_id, :referee_id

  set_primary_key "id"
  set_table_name "papers_publication_referee_jcn"

  belongs_to :referee
  belongs_to :publication

end
