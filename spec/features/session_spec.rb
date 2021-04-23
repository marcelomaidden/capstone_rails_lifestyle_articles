require 'rails_helper'
require_relative 'article_helper'

RSpec.feature 'Session' do
  before :each do
    article_basic
  end

  let :login do
    visit login_path
    fill_in 'username', with: 'marcelomaidden'
    click_button 'Enter'
  end

  it 'signs me in with the right credentials' do
    login
    expect(page).to have_text 'LOG-OUT'
  end

  it 'return an error when wrong username was provided' do
    visit login_path
    fill_in 'username', with: 'marcelo'
    click_button 'Enter'
    expect(page).to have_text 'Username not found'
  end

  it 'signs me out' do
    login

    first('a', text: 'LOG-OUT').click

    expect(page).to have_text 'SIGN-IN'
  end
end
