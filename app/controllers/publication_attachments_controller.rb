class PublicationAttachmentsController < ApplicationController
  # GET /publication_attachments
  # GET /publication_attachments.json
  before_filter :authenticate_user!
  def index
    @publication_attachments = PublicationAttachment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @publication_attachments }
    end
  end

  # GET /publication_attachments/1
  # GET /publication_attachments/1.json
  def show
    @publication_attachment = PublicationAttachment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @publication_attachment }
    end
  end

  # GET /publication_attachments/new
  # GET /publication_attachments/new.json
  def new
    @publication = Publication.find(params[:publication_id])
    @publication_attachment = @publication.attachments.build
    #@publication_attachment = PublicationAttachment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @publication_attachment }
    end
  end

  # GET /publication_attachments/1/edit
  def edit
    @publication_attachment = PublicationAttachment.find(params[:id])
  end

  # POST /publication_attachments
  # POST /publication_attachments.json
  def create
    @publication = Publication.find(params[:publication_id])
    @publication_attachment = @publication.attachments.build(params[:publication_attachment])
    #@publication_attachment = PublicationAttachment.new(params[:publication_attachment])

    respond_to do |format|
      if @publication_attachment.save
        @publication.touch
        format.html { redirect_to @publication_attachment, :notice => 'Publication attachment was successfully created.' }
        format.json { render :json => @publication_attachment, :status => :created, :location => @publication_attachment }
      else
        format.html { render :action => "new" }
        format.json { render :json => @publication_attachment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /publication_attachments/1
  # PUT /publication_attachments/1.json
  def update
    @publication_attachment = PublicationAttachment.find(params[:id])
    respond_to do |format|
      if @publication_attachment.update_attributes(params[:publication_attachment])
        format.html { redirect_to @publication_attachment, :notice => 'Publication attachment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @publication_attachment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /publication_attachments/1
  # DELETE /publication_attachments/1.json
  def destroy
    @publication_attachment = PublicationAttachment.find(params[:id])
    @publication_attachment.destroy

    respond_to do |format|
      format.html { redirect_to publication_attachments_url }
      format.json { head :ok }
    end
  end

end
