require 'spec_helper'
require "factories/factory"


describe ComentsController do
let!(:hotel){FactoryGirl.create :hotel}
  before do
    @user = FactoryGirl.create :user
    sign_in @user
  end
  after do
    User.last.destroy
  end
  describe "GET new" do
    it "render :new template" do
      get :new, hotel_id: hotel
      response.should render_template("new")
    end
  end

  describe "POST create" do
    it "create a new coment" do
       expect{ post :create, hotel_id: hotel, coment: FactoryGirl.attributes_for(:coment)
        }.to change(Coment,:count).by(1)
    end

    it "redirects to the new contact" do 
      post :create, hotel_id: hotel, coment: FactoryGirl.attributes_for(:coment) 
      response.should redirect_to hotel_path(hotel)
    end 
  end 
end