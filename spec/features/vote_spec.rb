require 'rails_helper'
require_relative './article_helper'

RSpec.feature 'Votes', type: :feature do
  before :each do
    article_basic
  end

  let :login do
    visit login_path
    fill_in 'username', with: 'marcelomaidden'
    click_on 'Enter'
  end

  context 'Votes' do
    it 'Register a vote' do
      login
      visit '/votes/new?article_id=1'

      expect(page).to have_text 'Vote registered successfully'
    end
    it 'Deletes a vote' do
      login
      visit '/votes/edit?article_id=1'

      expect(page).to have_text 'Vote successfully deleted'
    end
  end
end
