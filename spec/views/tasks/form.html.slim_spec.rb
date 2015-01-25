require 'rails_helper'

describe 'tasks/_form.html.slim' do
  let(:user) { create :user }
  let(:wolverine) { create :user }

  before { allow(view).to receive(:current_user).and_return user }

  subject { rendered }

  context 'finished' do
    context 'when task is persisted' do
      let(:task) { create :task, owner: user }

      context 'when current user is task owner' do
        before do
          assign :task, task
          render
        end

        it { is_expected.to have_content 'Finished' }
      end

      context 'when current user is assigned user' do
        before do
          allow(view).to receive(:current_user).and_return wolverine
          allow(task).to receive(:user).and_return wolverine
          assign :task, task
          render
        end

        it { is_expected.to have_content 'Finished' }
      end

      context 'when current user is not task owner or assigned user' do
        let(:beast) { create :user }
        let(:task) { create :task, owner: beast, user: beast }
        before do
          assign :task, task
          render
        end

        it { is_expected.not_to have_content 'Finished' }
      end
    end
  end
end
