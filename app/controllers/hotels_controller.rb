class HotelsController < ApplicationController
  # GET users/1/hotels
  # GET users/1/hotels.json
  def index
  if params[:user_id]
    @user = User.find(params[:user_id])
    visited = @user.visited
    @hotels = Hotel.find(visited)
  else
    @hotels = Hotel.all
  end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @hotels }
    end
  end

  # GET users/1/hotels/1
  # GET users/1/hotels/1.json
  def show
    @hotel = Hotel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @hotel }
    end
  end

  # GET users/1/hotels/new
  # GET users/1/hotels/new.json
  def new
    @user = User.find(params[:user_id])
    @hotel = @user.hotels.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @hotel }
    end
  end

  # GET users/1/hotels/1/edit
  def edit
    @user = User.find(params[:user_id])
    @hotel = @user.hotels.find(params[:id])
  end

  # POST users/1/hotels
  # POST users/1/hotels.json
  def create
    @user = User.find(params[:user_id])
    @hotel = @user.hotels.build(params[:hotel])
    respond_to do |format|
      if @hotel.save
        format.html { redirect_to(user_hotel_visited_path(current_user, @hotel), :notice => 'Hotel was successfully created.') }
        format.json { render :json => @hotel, :status => :created, :location => [@hotel.user, @hotel] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @hotel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT users/1/hotels/1
  # PUT users/1/hotels/1.json
  def update
    @user = User.find(params[:user_id])
    @hotel = @user.hotels.find(params[:id])

    respond_to do |format|
      if @hotel.update_attributes(params[:hotel])
        format.html { redirect_to([@hotel.user, @hotel], :notice => 'Hotel was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @hotel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE users/1/hotels/1
  # DELETE users/1/hotels/1.json
  def add_to_visited
    @user = User.find(params[:user_id])
    visited = @user.visited_hotels     
    @user.visited_hotels = [visited, params[:hotel_id]].join(' ')
    @user.save
    redirect_to user_hotels_path(@user)
  end
end
