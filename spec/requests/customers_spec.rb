require 'spec_helper'

 describe "customer" do

  describe "Index page" do
    it "should have the content 'Ruby Benefit Fund'" do
	visit '/customer/index'
	page.should have_content('Ruby Benefit Fund')      
    end
  end

  describe "show page" do
    it "should have the content 'show'" do
	visit '/customer/show'
	page.should have_content('show')      
    end
  end

describe "pagination" do

      before(:all) { 30.times { FactoryGirl.create(:user) } }
      after(:all)  { User.delete_all }

      it { should have_selector('div.pagination') }

      it "should list each user" do
        User.paginate(page: 1).each do |user|
          page.should have_selector('li', text: user.name)
        end
      end
    end
end
