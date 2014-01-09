require 'spec_helper'


describe UsersController do
  describe "GET #show" do 
  	it "assigns the requested user to @user" do 
  		user = FactoryGirl.create :user
  		sign_in user
  		get :show, id: user 
  		assigns(:user).should eq(user)
  		User.last.destroy 
  	end 
  	it "renders the #show view" do 
  		user = FactoryGirl.create :user
  		sign_in user
  		get :show, id: user
  		response.should render_template :show 
  		User.last.destroy 
  	end 
  end

  describe "GET new" do
  	it "render new teplate" do
  		user = FactoryGirl.create :user
  		sign_in user
  		get :new
  		response.should render_template :new
  		User.last.destroy 
  	end
  end

  describe "GET edit" do
  	it "render edit teplate" do
  		user = FactoryGirl.create :user
  		sign_in user
  		get :edit, id: user
  		response.should render_template :edit
  		User.last.destroy 
  	end
  end
 
end
