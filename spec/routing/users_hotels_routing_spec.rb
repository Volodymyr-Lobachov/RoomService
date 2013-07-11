require "spec_helper"

describe HotelsController do
  describe "routing" do

    it "routes to #index" do
      get("/users/1/hotels").should route_to(:action => "index", 
                    :controller => "hotels", :user_id => '1' )
    end

    it "routes to #new" do
      get("/users/1/hotels/new").should route_to(:action => "new", 
                    :controller => "hotels", :user_id => '1' )
    end

    it "routes to #show" do
      get("/users/1/hotels/1").should route_to(:action => "show", 
                    :controller => "hotels", :user_id => "1", :id => "1" )
    end

    it "routes to #edit" do
      get("/users/1/hotels/1/edit").should route_to(:action => "edit", 
                    :controller => "hotels", :user_id => "1", :id => "1" )
    end

    it "routes to #create" do
      post("/users/1/hotels").should route_to(:action => "create", 
                    :controller => "hotels", :user_id => "1" )
    end

    it "routes to #update" do
      put("/users/1/hotels/1").should route_to(:action => "update", 
                    :controller => "hotels", :user_id => "1", :id => "1" )
    end

    it "routes to #add_to_visited" do
      get("/users/1/hotels/1/visited").should route_to(:action => "add_to_visited", 
                    :controller => "hotels", :user_id => "1", :hotel_id => "1" )
    end

  end
end
