require "spec_helper"

describe HotelsController do
  describe "routing" do

    it "routes to #main" do
      get("/main").should route_to("hotels#main")
    end



    it "routes to #index" do
      get("/hotels").should route_to("hotels#index")
    end



    it "routes to #show" do
      get("/hotels/1").should route_to("hotels#show", :id => "1")
    end

  end
end
