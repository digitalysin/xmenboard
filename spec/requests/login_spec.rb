require 'rails_helper'

describe 'login' do
  let(:user) { create :user }

  it 'can login' do
    visit root_path
    expect(page).to have_content 'Login'

    click_link 'Login'
    expect(current_path).to eq new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: 'secret1234'
    click_button 'Sign in'

    expect(page).to have_content user.first_name
  end

end
