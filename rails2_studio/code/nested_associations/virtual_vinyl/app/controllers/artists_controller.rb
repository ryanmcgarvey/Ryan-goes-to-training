class ArtistsController < ApplicationController 
  
  before_filter :find_artist, :only => %w{ show edit update }
  
  def index 
    @artists = Artist.index_listing
  end

  def new
    @artist = Artist.new
  end
  
  def create
    @artist = Artist.new(params[:artist])
    if @artist.save
      redirect_to artist_url(@artist)
    else
      render :action => 'new'
    end
  end 
  
  def update 
    if @artist.update_attributes(params[:artist])
      redirect_to artist_url(@artist)
    else
      render :action => 'edit'
    end
  end       
  
  private
  
  def find_artist
    @artist = Artist.find(params[:id])
  end
end
