require 'spec_helper'
require "factories/factory"


describe PhotosController do
let!(:hotel){FactoryGirl.create :hotel}
let!(:photo){FactoryGirl.create :photo}
  describe "GET index" do
    it "render index" do
      @user = FactoryGirl.create :user
      sign_in @user  		
  		get :index,:hotel_id =>hotel
      response.should render_template("index")
  		User.last.destroy
  	end
  end
 describe "GET show" do
    it "get photo" do
      @user = FactoryGirl.create :user
      sign_in @user
      get :show, hotel_id: hotel, id: photo
      response.body == photo
      User.last.destroy
    end
    it "render :show tempate" do
      @user = FactoryGirl.create :user
      sign_in @user
      get :show, hotel_id: hotel, id: photo
      response.should render_template("show")
      User.last.destroy  
    end
  end

  describe "GET new" do
    it "render :new template" do
      @user = FactoryGirl.create :user
      sign_in @user
      get :new, hotel_id: hotel
      response.should render_template("new")
      User.last.destroy 
    end
  end

  describe "GET edit" do
    it "render :edit template" do
      @user = FactoryGirl.create :user
      sign_in @user
      get :edit, hotel_id: hotel, id: photo
      response.should render_template("edit")
      User.last.destroy 
    end
  end

  describe "POST create" do
    it "create a new hotel" do
      @user = FactoryGirl.create :user
      sign_in @user      
       expect{ post :create, hotel_id: hotel.id, photo: FactoryGirl.attributes_for(:photo)
        }.to change(Photo,:count).by(1)
      User.last.destroy 
    end

    it "redirects to the new contact" do 
      @user = FactoryGirl.create :user
      sign_in @user 
      photo.id = 2 
      photo.save
      post :create, hotel_id: hotel, photo: FactoryGirl.attributes_for(:photo) 
      response.should redirect_to([hotel, photo])
      User.last.destroy 
    end 
  end 
end