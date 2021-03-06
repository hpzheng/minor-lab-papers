class PublicationsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  respond_to :html, :json

  def index
    @publications = Publication.active_publications.all
    @referees = Referee.all
  end

  def urgent_papers 
    @publications = Publication.waiting_for_wladek.all
  end

  def accepted_papers 
    @publications = Publication.accepted_publications.all
  end

  def edit
    @publication = Publication.find(params[:id])
    #@statuses = @publication.pub_statuses
  end

  def show
    @publication = Publication.find(params[:id])
    #@statuses = @publication.pub_statuses
  end


  def show_status
    @title = Publication.find(params[:id]).topic
    @statuses = Publication.find(params[:id]).pub_statuses
  end

  def new
    @title = "New Publication"
    @publication = Publication.new
  end

  def create
    @publication = Publication.new(params[:publication])
    if @publication.save
      redirect_to publication_path(@publication), :notice => 'Publication was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    @publication = Publication.find(params[:id])
    @pub_statuses = @publication.pub_statuses
    flash[:notice] = "Publication was updated successfully!" if @publication.update_attributes(params[:publication])
    respond_with @publication
    # if @publication.update_attributes(params[:publication])
    #   redirect_to publication_path(@publication), :notice => 'User was successfully updated.'
    # else
    #    render :action => "edit"
    # end
  end

#  # DELETE /users/1
#  # DELETE /users/1.json
#  def destroy
#    @user = User.find(params[:id])
#    @user.destroy
#
#    respond_to do |format|
#      format.html { redirect_to users_url }
#      format.json { head :ok }
#    end
#  end


end
