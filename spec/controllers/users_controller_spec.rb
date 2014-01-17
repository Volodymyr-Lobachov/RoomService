require 'spec_helper'


describe UsersController do
  before do
    @user = FactoryGirl.create :user
    sign_in @user
  end
  after do
    User.last.destroy
  end
  describe "GET #show" do 
  	it "assigns the requested user to @user" do 
  		get :show, id: @user 
  		assigns(:user).should eq(@user)
  	end 
  	it "renders the #show view" do 
  		get :show, id: @user
  		response.should render_template :show 
  	end 
  end

  describe "GET new" do
  	it "render new teplate" do
  		get :new
  		response.should render_template :new
  	end
  end

  describe "GET edit" do
  	it "render edit teplate" do
  		get :edit, id: @user
  		response.should render_template :edit
  	end
  end
end
