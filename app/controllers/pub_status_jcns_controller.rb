class PubStatusJcnsController < ApplicationController

#  def create
#    @publication.find(params[:id])
#    publication.pub_statuses.create!(params[:pub_status_jcn])
#  end
#
#  def new
#    @publication = Publication.find(params[:id])
#    @pub_status = @publication.pub_statuses.build
#  end
  def index
    @publication = Publication.find(params[:publication_id])
    @statuses = @publication.pub_statuses
  end
end
