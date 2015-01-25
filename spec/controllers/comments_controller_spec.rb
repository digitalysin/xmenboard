require 'rails_helper'

describe CommentsController do
  let(:user) { create :user }
  let(:task) { create :task }

  before { sign_in user }

  describe 'POST /create' do
    let(:comment_attributes) { attributes_for :comment }
    before { post :create, task_id: task, comment: comment_attributes }

    it { is_expected.to respond_with :redirect }
    it { is_expected.to redirect_to task_path(task) }
  end
end
