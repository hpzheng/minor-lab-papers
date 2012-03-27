class PublicationsController < ApplicationController

  def index
    @publications = Publication.all
  end

  def edit
    @publication = Publication.find(params[:id])
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
    if @user.save
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
