require 'spec_helper'
require "factories/factory"


describe PhotosController do
let!(:hotel){FactoryGirl.create :hotel}
let!(:photo){FactoryGirl.create :photo}
  before do
    @user = FactoryGirl.create :user
    sign_in @user
  end
  after do
    User.last.destroy
  end
  describe "GET index" do
    it "render index" do
  		get :index,:hotel_id =>hotel
      response.should render_template("index")
  	end
  end
 describe "GET show" do
    it "get photo" do
      get :show, hotel_id: hotel, id: photo
      response.body == photo
    end
    it "render :show tempate" do
      get :show, hotel_id: hotel, id: photo
      response.should render_template("show")
    end
  end

  describe "GET new" do
    it "render :new template" do
      get :new, hotel_id: hotel
      response.should render_template("new")
    end
  end

  describe "GET edit" do
    it "render :edit template" do
      get :edit, hotel_id: hotel, id: photo
      response.should render_template("edit")
    end
  end

  describe "POST create" do
    it "create a new hotel" do
       expect{ post :create, hotel_id: hotel.id, photo: FactoryGirl.attributes_for(:photo)
        }.to change(Photo,:count).by(1)
    end

    it "redirects to the new contact" do 
      photo.id = 2 
      photo.save
      post :create, hotel_id: hotel, photo: FactoryGirl.attributes_for(:photo) 
      response.should redirect_to([hotel, photo])
    end 
  end 
end