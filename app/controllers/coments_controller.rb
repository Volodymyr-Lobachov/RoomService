class ComentsController < ApplicationController

  def new
    @hotel = Hotel.find(params[:hotel_id])
    @coment = @hotel.coments.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @coment }
    end
  end
  
  def create
    @hotel = Hotel.find(params[:hotel_id])
    @coment = @hotel.coments.build(params[:coment])
    @coment.user = current_user
    respond_to do |format|
      if @coment.save
        format.html { redirect_to hotel_path(@hotel)}
        format.json { render :json => @coment, :status => :created, :location => [@coment.hotel, @coment] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @coment.errors, :status => :unprocessable_entity }
      end
    end
  end
end
