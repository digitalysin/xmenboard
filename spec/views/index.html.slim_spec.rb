require 'rails_helper'

describe 'home/index.html.slim' do
  let(:user) { create :user }
  before { allow(view).to receive(:current_user).and_return user }

  context 'Owned Tasks' do
    subject { rendered }

    context 'when user has owned tasks' do
      let(:task) { build :task, owner: user }
      before do
        allow(user).to receive(:task_owners).and_return [task]
        render
      end
      it { is_expected.to have_content 'Owned Task' }
      it { is_expected.to have_content task.name }
    end

    context 'when user has finished owned task' do
      let(:wolverine) { build :user, first_name: 'Wolverine' }
      let(:task) { build :task, owner: user, user: wolverine, finished: true, finished_at: 1.day.ago }

      before do
        allow(user).to receive(:task_owners).and_return [task]
        render
      end

      it { is_expected.to have_content "Finished by #{wolverine.first_name} at #{task.finished_at.to_s(:short)}" }

    end

    context 'when user has no owned task' do
      it { is_expected.not_to have_content 'Owned Task' }
    end
  end


  context 'Pending Tasks' do
    subject { rendered }

    context 'when user has pending task' do
      let!(:task) { create :task, user: user, finished: false }

      before { render }

      it { is_expected.to have_content 'Pending Tasks' }
      it { is_expected.to have_content task.name }
    end

    context 'when user has no pending task' do
      let!(:task) { create :task, user: user, finished: true }

      before { render }

      it { is_expected.not_to have_content 'Pending Tasks' }
    end
  end

  context 'Finished Task' do
    subject { rendered }

    context 'when user has finished task' do
      let!(:task) { create :task, user: user, finished: true }

      before { render }

      it { is_expected.to have_content 'Finished Tasks' }
      it { is_expected.to have_content task.name }
    end
  end
end
