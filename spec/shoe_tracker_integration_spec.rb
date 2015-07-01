ENV['RACK_ENV'] = 'test'
require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Shoe Tracker', type: :feature) do

  describe('Home', {:type => :feature}) do
    it('displays expected home page content') do
      visit('/')
      page.should have_content("Welcome to the Shoe Database!")
    end
  end

  describe('add store') do
    it('adds a new store') do
      visit('/')
      fill_in('name', with: 'Cabella')
      click_button('Add store')
      expect(page).to(have_content('Cabella'))
    end
  end

  describe('add shoe') do
    it('adds a new shoe') do
      visit('/')
      fill_in('brand', with: 'Nike')
      click_button('Add shoe')
      expect(page).to(have_content('Nike'))
    end
  end
end
