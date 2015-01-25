require 'rails_helper'

describe TasksController do
  let(:user) { create :user }

  before { sign_in user }

  describe 'GET /new' do
    before { get :new }
    it { is_expected.to respond_with :ok }
    it { expect(assigns :task).to be_new_record }
  end

  describe '/POST create' do
    let(:task_attributes) { attributes_for :task }

    context 'when create task with valid data' do
      before { post :create, task: task_attributes }
      it { is_expected.to respond_with :redirect }
      it { is_expected.to redirect_to root_path }
    end

    context 'when create task with invalid data' do
      before { post :create, task: task_attributes.merge(name: '') }
      it { is_expected.to respond_with :ok }
      it { is_expected.not_to redirect_to root_path }
    end
  end

  describe 'GET /show' do
    let(:task) { create :task }
    before { get :show, id: task }
    it { is_expected.to respond_with :ok }
  end

  describe 'GET /edit' do
    let(:task) { create :task, owner: user }
    before { get :edit, id: task }

    it { is_expected.to respond_with :ok }
  end

  describe 'PATCH /update' do
    let(:task) { create :task, owner: user }

    context 'when update task with valid data' do
      before { patch :update, id: task, task: task.attributes }

      it { is_expected.to respond_with :redirect }
      it { is_expected.to redirect_to root_path }
    end

    context 'when update task with invalid data' do
      before { patch :update, id: task, task: task.attributes.merge(name: '') }
      it { is_expected.to respond_with :ok }
      it { is_expected.not_to redirect_to root_path }
    end
  end
end
