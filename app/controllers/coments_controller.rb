class ComentsController < ApplicationController
  # GET hotels/1/coments
  # GET hotels/1/coments.json
  def index
    @hotel = Hotel.find(params[:hotel_id])
    @coments = @hotel.coments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @coments }
    end
  end

  # GET hotels/1/coments/1
  # GET hotels/1/coments/1.json
  def show
    @hotel = Hotel.find(params[:hotel_id])
    @coment = @hotel.coments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @coment }
    end
  end

  # GET hotels/1/coments/new
  # GET hotels/1/coments/new.json
  def new
    @hotel = Hotel.find(params[:hotel_id])
    @coment = @hotel.coments.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @coment }
    end
  end

  # GET hotels/1/coments/1/edit
  def edit
    @hotel = Hotel.find(params[:hotel_id])
    @coment = @hotel.coments.find(params[:id])
  end

  # POST hotels/1/coments
  # POST hotels/1/coments.json
  def create
    @hotel = Hotel.find(params[:hotel_id])
    @coment = @hotel.coments.build(params[:coment])
    @coment.user = current_user
    respond_to do |format|
      if @coment.save
        format.html { redirect_to([@coment.hotel, @coment], :notice => 'Coment was successfully created.') }
        format.json { render :json => @coment, :status => :created, :location => [@coment.hotel, @coment] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @coment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT hotels/1/coments/1
  # PUT hotels/1/coments/1.json
  def update
    @hotel = Hotel.find(params[:hotel_id])
    @coment = @hotel.coments.find(params[:id])

    respond_to do |format|
      if @coment.update_attributes(params[:coment])
        format.html { redirect_to([@coment.hotel, @coment], :notice => 'Coment was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @coment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE hotels/1/coments/1
  # DELETE hotels/1/coments/1.json
  def destroy
    @hotel = Hotel.find(params[:hotel_id])
    @coment = @hotel.coments.find(params[:id])
    @coment.destroy

    respond_to do |format|
      format.html { redirect_to hotel_coments_url(hotel) }
      format.json { head :ok }
    end
  end
end
