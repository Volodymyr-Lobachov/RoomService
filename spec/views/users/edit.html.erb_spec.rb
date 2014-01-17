require 'spec_helper'

describe "users/edit" do
	let(:user) do
		stub_model(User, name: "Alan", email: "111@ukr.net")
	end
	before do
		assign(:user, user)
		render
	end
	it "displays user name" do
		expect(rendered).to include("Alan")
	end
	it "displays user email" do
		expect(rendered).to include("111@ukr.net")
	end
	it "contains form" do
		rendered.should have_selector("form") do |f|
			f.should have_selector("input",type: "text", value: "Alen")
			f.should have_selector("input",type: "email", value: "111@ukr.net")
			f.should have_selector("input",type: "submit", value: "Update User")
		end
	end
end
