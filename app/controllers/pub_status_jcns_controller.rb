class PubStatusJcnsController < ApplicationController
  before_filter :authenticate_user!

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
      @publication.touch
      redirect_to @publication, :notice => 'New status successfully added!'
    else
      render :action => "new"
    end
  end

  def update
    @publication = Publication.find(params[:id])
    if @publication.update_attributes(params[:publication])
      @publication.touch
      redirect_to publication_path(@publication), :notice => 'Status was successfully updated!'
    else
       render :action => "edit"
    end
  end

end
