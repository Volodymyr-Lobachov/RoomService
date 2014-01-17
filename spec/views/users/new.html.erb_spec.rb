require 'spec_helper'

describe "users/new" do

	let(:user) do
		stub_model(User).as_new_record.as_null_object
	end
	before do
		assign(:user, user)
	end

 	it "contains form" do
		render
		rendered.should have_selector("form") do |f|
			f.should have_selector("input",type: "text")
			f.should have_selector("input",type: "email")
			f.should have_selector("input",type: "submit")
		end
	end
end
