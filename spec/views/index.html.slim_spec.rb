require 'rails_helper'

describe 'home/index.html.slim' do
  let(:user) { build :user }
  context 'Owned Tasks' do
    before { allow(view).to receive(:current_user).and_return user }
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

    context 'when user has no owned task' do
      it { is_expected.not_to have_content 'Owned Task' }
    end
  end
end
