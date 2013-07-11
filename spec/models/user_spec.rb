require 'spec_helper'

describe User do
  before(:each) do
  @user = User.create
  @user.visited_hotels = "1 2 3"
  end

	describe "#visited" do
		it "should be visited" do
			@user.visited.should == ["1","2",'3']
		end
	end
end
