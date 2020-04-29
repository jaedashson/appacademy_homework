class AlbumsController < ApplicationController

  def create
    @bands = Band.all
    @album = Album.new(album_params)
    debugger
    if @album.save
      redirect_to album_url(@album)
    else
      render json: params
    end
  end

  def new
    @bands = Band.all
    @album = Album.new 
    @band_id = params[:band_id]
    render :new
  end

  def edit
    @bands = Band.all
    @album = Album.find_by(id: params[:id])
    render :edit 
  end

  def show
    @album = Album.find_by(id: params[:id])
    @artist = Band.find_by(params[:artist_id]).name
    render :show
  end

  def update
    @bands = Band.all
    @album = Album.find_by(id: params[:id])
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    b_id = @album.band_id
    @album.destroy
    redirect_to band_url(b_id)
  end

  def album_params
    params.require(:album).permit(:title, :year, :band_id, :live)
  end

end