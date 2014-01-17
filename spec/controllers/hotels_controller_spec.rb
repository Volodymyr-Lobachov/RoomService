require 'spec_helper'
require "factories/factory"


describe HotelsController do
let!(:hotel){FactoryGirl.create :hotel}
  before do
    @user = FactoryGirl.create :user
    sign_in @user
  end
  after do
    User.last.destroy
  end
  describe "GET index" do
    it "select all hotels" do	  
  		get :index, format: :json
  		response.body.should == Hotel.all.to_json
  	end

  	it "shoould render visited hotels" do
      @hotels = Array.new(3){FactoryGirl.create :hotel}
  		
  		get :index,{:user_id =>@user.id}
      response.should render_template("visited_hotels")
  	end
  end
 describe "GET show" do
    it "get hotel" do
      get :show, id: hotel
      response.body == hotel
    end
    it "render :show tempate" do
      get :show, id: hotel
      response.should render_template("show")
    end

    it "get hotel coments" do
      @coments = Array.new(3){FactoryGirl.create :coment}
      hotel.coments == @coments
    end
  end

  describe "GET new" do
    it "render :new template" do
      get :new,{user_id: @user}
      response.should render_template("new")
    end
  end

  describe "GET edit" do
    it "render :edit template" do
      hotel.user_id =5
      hotel.save
      get :edit, user_id: @user, id: hotel
      response.should render_template("edit")
    end
  end

  describe "POST create" do
    it "create a new hotel" do
       expect{ post :create, user_id: @user, hotel: FactoryGirl.attributes_for(:hotel)
        }.to change(Hotel,:count).by(1)
    end

    it "redirects to the new contact" do 
      post :create, user_id: @user, hotel: FactoryGirl.attributes_for(:hotel) 
      response.should redirect_to user_hotel_visited_path(@user, 2)
    end 
  end 

  describe "GET main" do 
    it "get top 5" do
      Array.new(5) { FactoryGirl.create :hotel }
      hotels = Hotel.get_top_five_hotels
      get :main
      response.body == hotels
    end

    it "render main template" do
      get :main
      response.should render_template("main")
    end
  end
end