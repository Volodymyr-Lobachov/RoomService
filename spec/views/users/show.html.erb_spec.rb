require 'spec_helper'
describe "users/show" do
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
		rendered.should have_selector("dl") do |f|
			f.should have_selector("dd", value: "Alen")
			f.should have_selector("dd", value: "111@ukr.net")
			f.should have_selector("a", href: "#{hotels_path}")
			f.should have_selector("a", href: "#{edit_user_path(@user)}")
		end
	end
end
