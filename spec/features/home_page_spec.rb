require 'spec_helper'

describe 'Home Page', type: :feature do
  describe 'with javascript', js: true do
    it 'has a working ajax form to display a die roll' do
      visit '/'
      click_button 'button_go'
      expect(page).to have_content 'Ajax says '
    end
  end

  describe 'without javascript' do
    it 'has a working html form to display a die roll' do
      visit '/'
      click_button 'button_go'
      expect(page).to have_content 'HTML says '
    end
  end
end
