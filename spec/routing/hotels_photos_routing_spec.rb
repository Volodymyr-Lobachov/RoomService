require "spec_helper"

describe PhotosController do
  describe "routing" do

    it "routes to #index" do
      get("/hotels/1/photos").should route_to(:action => "index", 
                    :controller => "photos", :hotel_id => '1' )
    end

    it "routes to #new" do
      get("/hotels/1/photos/new").should route_to(:action => "new", 
                    :controller => "photos", :hotel_id => '1' )
    end

    it "routes to #show" do
      get("/hotels/1/photos/1").should route_to(:action => "show", 
                    :controller => "photos", :hotel_id => "1", :id => "1" )
    end

    it "routes to #edit" do
      get("/hotels/1/photos/1/edit").should route_to(:action => "edit", 
                    :controller => "photos", :hotel_id => "1", :id => "1" )
    end

    it "routes to #create" do
      post("/hotels/1/photos").should route_to(:action => "create", 
                    :controller => "photos", :hotel_id => "1" )
    end

    it "routes to #update" do
      put("/hotels/1/photos/1").should route_to(:action => "update", 
                    :controller => "photos", :hotel_id => "1", :id => "1" )
    end

    it "routes to #destroy" do
      delete("hotels/1/photos/1").should route_to(:action => "destroy", 
                    :controller => "photos", :hotel_id => "1", :id => "1" )
    end


  end
end
