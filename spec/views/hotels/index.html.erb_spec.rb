require 'spec_helper'
describe "hotels/index" do
	let(:hotels) do
		[stub_model(Hotel, title: "dsa",
							country: "usa",
							state: "olo",
							city: "asd",
							street: "zxc",
							id: 5),
		stub_model(Hotel, title: "wdsa",
		  					country: "wusa",
		  					state: "wolo",
		  					city: "wasd",
		  					street: "wzxc",
		  					id: 1)]	
	end
	before do
		@user = FactoryGirl.create :user
  		sign_in @user
		assign(:hotels, hotels)
		view.stub(:will_paginate)
		render
	end
	after do
		User.last.destroy 
	end
	it "hotels title" do		
		expect(rendered).to include("dsa")
		expect(rendered).to include("wdsa")
	end
	it "hotels country" do		
		expect(rendered).to include("usa")
		expect(rendered).to include("wusa")
	end
	it "hotels state" do		
		expect(rendered).to include("olo")
		expect(rendered).to include("wolo")
	end
	it "hotels city" do		
		expect(rendered).to include("asd")
		expect(rendered).to include("wasd")
	end
	it "hotels street" do		
		expect(rendered).to include("zxc")
		expect(rendered).to include("wzxc")
	end
end
