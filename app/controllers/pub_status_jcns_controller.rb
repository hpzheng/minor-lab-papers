class PubStatusJcnsController < ApplicationController

#  def create
#    @publication.find(params[:id])
#    publication.pub_statuses.create!(params[:pub_status_jcn])
#  end
#
  def new
    @publication = Publication.find(params[:publication_id])
    @pub_status = @publication.pub_statuses.build
    @title = "#{@publication.topic} New Status"
  end
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

#  def new
#    @title = "New Publication Status"
#    @publication = Publication.new
#  end

  def create
    @publication = Publication.find(params[:publication_id])
    @pub_status = @publication.pub_statuses.build(params[:pub_status_jcn])
    if @pub_status.save
      redirect_to @publication, notice: 'User was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @publication = Publication.find(params[:id])
    if @publication.update_attributes(params[:publication])
      redirect_to publications_path, notice: 'User was successfully updated.'
    else
       render action: "edit"
    end
  end

end
