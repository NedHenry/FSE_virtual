require 'rails_helper'

RSpec.describe 'Welcome Page - ', type: :feature do
  describe 'When a guest user first visits the site' do
    it 'shows the welcome page' do
      visit '/'
      expect(page).to have_content("Welcome")
    end
  end
end
