require 'spec_helper'
require "factories/factory"


describe ComentsController do
let!(:hotel){FactoryGirl.create :hotel}
  
  describe "GET new" do
    it "render :new template" do
      @user = FactoryGirl.create :user
      sign_in @user
      get :new, hotel_id: hotel
      response.should render_template("new")
      User.last.destroy 
    end
  end

  describe "POST create" do
    it "create a new coment" do
      @user = FactoryGirl.create :user
      sign_in @user      
       expect{ post :create, hotel_id: hotel, coment: FactoryGirl.attributes_for(:coment)
        }.to change(Coment,:count).by(1)
      User.last.destroy 
    end

    it "redirects to the new contact" do 
      @user = FactoryGirl.create :user
      sign_in @user 
      post :create, hotel_id: hotel, coment: FactoryGirl.attributes_for(:coment) 
      response.should redirect_to hotel_path(hotel)
      User.last.destroy 
    end 
  end 
end