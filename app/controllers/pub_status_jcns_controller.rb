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
  def edit
    @publication = Publication.find(params[:publication_id])
    @status = @publication.pub_statuses.find(params[:id])
  end
  def show
    @publication = Publication.find(params[:publication_id])
    @status = @publication.pub_statuses.find(params[:id])
  end
  def index
    @publication = Publication.find(params[:publication_id])
    @statuses = @publication.pub_statuses
  end
end
