require 'rails_helper'

describe 'Create Task' do
  let(:user) { create :user }
  it 'can create and edit task and comment' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'secret1234'
    click_button 'Sign in'

    click_link 'New Task'
    fill_in 'Name', with: 'Sleep'
    fill_in 'Description', with: 'Description'

    click_button 'Create Task'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Sleep'

    visit edit_task_path(Task.first)

    fill_in 'Name', with: 'Eat Sleep Rave Repeat'
    click_button 'Update Task'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Eat Sleep Rave Repeat'

    visit task_path(Task.first)

    find('#comment_body').set '86!'
    click_button 'Create Comment'

    expect(current_path).to eq task_path(Task.first)
    expect(page).to have_content '86!'
  end
end
