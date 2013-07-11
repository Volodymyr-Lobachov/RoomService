require "spec_helper"

describe PhotosController do
  describe "routing" do



    it "routes to #new" do
      get("/hotels/1/coments/new").should route_to(:action => "new", 
                    :controller => "coments", :hotel_id => '1' )
    end

    it "routes to #create" do
      post("/hotels/1/coments").should route_to(:action => "create", 
                    :controller => "coments", :hotel_id => "1" )
    end
  end
end
