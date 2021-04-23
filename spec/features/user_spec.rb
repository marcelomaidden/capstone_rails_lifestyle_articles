# rubocop:disable Metrics/BlockLength

require 'rails_helper'
require_relative 'article_helper'

RSpec.feature 'Users', type: :feature do
  let :create_user do
    visit '/users/new'
    fill_in 'user_name', with: 'Marcelo'
    fill_in 'user_username', with: 'marcelomaidden'
    click_on('Create User')
  end

  before :each do
    create_user
  end

  let :login do
    visit login_path
    fill_in 'username', with: 'marcelomaidden'
    click_on 'Enter'
  end

  context 'Register' do
    it 'Creates a new user' do
      expect(page).to have_text 'User successfully created'
    end
  end

  context 'Users' do
    it "Shows user's informations and useful links" do
      id = User.find_by(name: 'Marcelo').id
      login
      visit "/users/#{id}"

      expect(page).to have_text 'Marcelo'
    end

    it 'Show all users' do
      login

      visit users_path
      expect(page).to have_text 'Marcelo'
    end
  end
end

# rubocop:enable Metrics/BlockLength
