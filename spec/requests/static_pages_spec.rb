require 'spec_helper'

describe "Static pages" do
  describe "Home page" do
    it "should have the content 'Sample App'" do      
      visit root_path
      expect(page).to have_content('Sample App')
    end

    it "should have the right title" do
      visit root_path
      expect(page).to have_title("RoR Tutorial")
    end

    it "should not have the wrong title" do
      visit root_path
      expect(page).not_to have_title('| Home')
    end 
  end
  
  describe "Help page Pirate yarrrr purple monkey" do
    it "Should have the content 'Sample App' PIRATES ATTACK YARRR PURPLE" do
      visit help_path
	  expect(page).to have_content('Sample App')
    end
  end

  describe "About page" do
    it "Should tell you something about it" do
	  visit about_path
      expect(page).to have_content('About')
    end
  end

  describe "Contact page" do
    it "should have the content contact" do
      visit contact_path
      expect(page).to have_content('Contact')
    end

    it "should have the title contact" do
      visit contact_path
      expect(page).to have_title("RoR Tutorial | Contact")
    end
  end
end
