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
end
