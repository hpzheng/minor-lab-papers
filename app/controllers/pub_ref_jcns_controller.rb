class PubRefJcnsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @publication = Publication.find(params[:publication_id])
    @pub_ref = @publication.pub_refs.build
    @title = "#{@publication.topic} New Referee"
  end

  def create
    @publication = Publication.find(params[:publication_id])
    @pub_ref = @publication.pub_refs.build(params[:pub_ref_jcn])
    if @pub_ref.save
      #@publication.touch
      redirect_to @publication, notice: 'User was successfully created.'
    else
      render action: "new"
    end
  end




end
