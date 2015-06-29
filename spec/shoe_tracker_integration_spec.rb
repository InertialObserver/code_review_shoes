ENV['RACK_ENV'] = 'test'
require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Shoe Tracker', type: :feature) do

  describe('add store') do
    it('adds a new store') do
      visit('/')
      fill_in('name', with: 'Cabella')
      click_button('Add Store')
      expect(page).to(have_content('Cabella'))
    end
  end
end
