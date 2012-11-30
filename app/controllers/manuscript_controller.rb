class ManuscriptController < ApplicationController

  before_filter :authenticate_user!

  def new
    @publication = Publication.find(params[:publication_id])
    @publication_manuscript = @publication.manuscripts.build
    #@publication_attachment = PublicationAttachment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @publication_manuscript }
    end
  end


  end

  def edit
    @publication_manuscript = Manuscript.find(params[:id])
  end

  def create
    @publication = Publication.find(params[:publication_id])
    @publication_manuscript = @publication.manuscripts.build(params[:publication_manuscript])

    respond_to do |format|
      if @publication_manuscript.save
        @publication.touch
        format.html { redirect_to edit_publication_path(@publication), :notice => 'Publication attachment was successfully created.' }
        format.json { render :json => @publication_manuscript, :status => :created, :location => @publication_manuscript }
      else
        format.html { render :action => "new" }
        format.json { render :json => @publication_manuscript.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /publication_attachments/1
  # PUT /publication_attachments/1.json
  def update
    @publication_manuscript = Manuscript.find(params[:id])
    respond_to do |format|
      if @publication_manuscript.update_attributes(params[:manuscript])
        format.html { redirect_to @publication_manuscript, :notice => 'Publication attachment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @publication_manuscript.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /publication_attachments/1
  # DELETE /publication_attachments/1.json
  def destroy
    @publication_manuscript = Manuscript.find(params[:id])
    @publication_manuscript.destroy

    respond_to do |format|
      format.html { redirect_to manuscripts_url }
      format.json { head :ok }
    end
  end


end
