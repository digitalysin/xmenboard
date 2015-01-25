require 'rails_helper'

describe HomeController do
  let(:user) { create :user }
  context 'when user already logged in' do
    before { sign_in user }
    describe 'GET /index' do
      before { get :index }
      it { is_expected.to respond_with :ok }
      it { is_expected.to render_template :index }
    end
  end

  context 'when user is not logged in' do
    before { get :index }
    it { is_expected.to respond_with :redirect }
    it { is_expected.to redirect_to new_user_session_path }
  end
end
