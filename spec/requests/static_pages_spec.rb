require 'spec_helper'

describe "Static pages" do
  describe "Home page" do
    it "should have the content 'Sample App'" do      
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end

    it "should have the right title" do
      visit '/static_pages/home'
      expect(page).to have_title("RoR Tutorial | Home")
    end
  end
  
  describe "Help page Pirate yarrrr purple monkey" do
    it "Should have the content 'Sample App' PIRATES ATTACK YARRR PURPLE" do
      visit '/static_pages/help'
	  expect(page).to have_content('Sample App')
    end
  end

  describe "About page" do
    it "Should tell you something about it" do
	  visit '/static_pages/about'
      expect(page).to have_content('About')
    end
  end
end
