class PhotosController < ApplicationController
  # GET hotels/1/photos
  # GET hotels/1/photos.json
  def index
    @hotel = Hotel.find(params[:hotel_id])
    @photos = @hotel.photos

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @photos }
    end
  end

  # GET hotels/1/photos/1
  # GET hotels/1/photos/1.json
  def show
    @hotel = Hotel.find(params[:hotel_id])
    @photo = @hotel.photos.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @photo }
    end
  end

  # GET hotels/1/photos/new
  # GET hotels/1/photos/new.json
  def new
    @hotel = Hotel.find(params[:hotel_id])
    @photo = @hotel.photos.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @photo }
    end
  end

  # GET hotels/1/photos/1/edit
  def edit
    @hotel = Hotel.find(params[:hotel_id])
    @photo = @hotel.photos.find(params[:id])
  end

  # POST hotels/1/photos
  # POST hotels/1/photos.json
  def create
    @hotel = Hotel.find(params[:hotel_id])
    @photo = @hotel.photos.build(params[:photo])

    respond_to do |format|
      if @photo.save
        format.html { redirect_to([@photo.hotel, @photo], :notice => 'Photo was successfully created.') }
        format.json { render :json => @photo, :status => :created, :location => [@photo.hotel, @photo] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT hotels/1/photos/1
  # PUT hotels/1/photos/1.json
  def update
    @hotel = Hotel.find(params[:hotel_id])
    @photo = @hotel.photos.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to([@photo.hotel, @photo], :notice => 'Photo was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE hotels/1/photos/1
  # DELETE hotels/1/photos/1.json
  def destroy
    @hotel = Hotel.find(params[:hotel_id])
    @photo = @hotel.photos.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to hotel_photos_url(hotel) }
      format.json { head :ok }
    end
  end
end
