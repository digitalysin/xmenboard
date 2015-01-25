require 'rails_helper'

describe 'tasks/show.html.slim' do
  let(:user) { create :user }
  let(:wolverine) { create :user }
  let(:task) { create :task, owner: user, user: wolverine }

  subject { rendered }

  context 'global' do
    before do
      assign :task, task
      render
    end
    it { is_expected.to have_content task.name }
    it { is_expected.to have_content wolverine.first_name }
    it { is_expected.to have_content task.description }
  end

  context 'when task is finished' do
    let(:yesterday) { 1.day.ago }
    before do
      allow(task).to receive(:finished?).and_return true
      allow(task).to receive(:finished_at).and_return yesterday
      assign :task, task
      render
    end

    it { is_expected.to have_content 'Finished' }
    it { is_expected.to have_content yesterday.to_s(:short) }
  end

  context 'when task is not finished' do
    before do
      assign :task, task
      render
    end
    it { is_expected.to have_content 'Open' }
    it { is_expected.to have_content task.created_at.to_s(:short) }
  end
end
