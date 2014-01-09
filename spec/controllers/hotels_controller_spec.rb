require 'spec_helper'
require "factories/factory"


describe HotelsController do
let!(:hotel){FactoryGirl.create :hotel}
  describe "GET index" do
    it "select all hotels" do
		  @user = FactoryGirl.create :user
  		sign_in @user
  		get :index, format: :json
  		response.body.should == Hotel.all.to_json
  		User.last.destroy
  	end

  	it "shoould render visited hotels" do
      @user = FactoryGirl.create :user
      sign_in @user
      @hotels = Array.new(3){FactoryGirl.create :hotel}
  		
  		get :index,{:user_id =>@user.id}
      response.should render_template("visited_hotels")
  		User.last.destroy
  	end
  end
 describe "GET show" do
    it "get hotel" do
      @user = FactoryGirl.create :user
      sign_in @user
      get :show, id: hotel
      response.body == hotel
      User.last.destroy
    end
    it "render :show tempate" do
      @user = FactoryGirl.create :user
      sign_in @user
      get :show, id: hotel
      response.should render_template("show")
      User.last.destroy  
    end

    it "get hotel coments" do
      @user = FactoryGirl.create :user
      sign_in @user
      @coments = Array.new(3){FactoryGirl.create :coment}
      hotel.coments == @coments
      User.last.destroy  
    end
  end

  describe "GET new" do
    it "render :new template" do
      @user = FactoryGirl.create :user
      sign_in @user
      get :new,{user_id: @user}
      response.should render_template("new")
      User.last.destroy 
    end
  end

  describe "GET edit" do
    it "render :edit template" do
      @user = FactoryGirl.create :user
      sign_in @user
      hotel.user_id =5
      hotel.save
      get :edit, user_id: @user, id: hotel
      response.should render_template("edit")
      User.last.destroy 
    end
  end

  describe "POST create" do
    it "create a new hotel" do
      @user = FactoryGirl.create :user
      sign_in @user      
       expect{ post :create, user_id: @user, hotel: FactoryGirl.attributes_for(:hotel)
        }.to change(Hotel,:count).by(1)
      User.last.destroy 
    end

    it "redirects to the new contact" do 
      @user = FactoryGirl.create :user
      sign_in @user 
      post :create, user_id: @user, hotel: FactoryGirl.attributes_for(:hotel) 
      response.should redirect_to user_hotel_visited_path(@user, 2)
      User.last.destroy 
    end 
  end 

  describe "GET main" do 
    it "get top 5" do
      @user = FactoryGirl.create :user
      sign_in @user     
      Array.new(5) { FactoryGirl.create :hotel }
      hotels = Hotel.get_top_five_hotels
      get :main
      response.body == hotels
      User.last.destroy 
    end

    it "render main template" do
      @user = FactoryGirl.create :user
      sign_in @user     
      get :main
      response.should render_template("main")
      User.last.destroy 
    end
  end
end