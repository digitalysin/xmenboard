require 'rails_helper'

describe Comment do
  it { is_expected.to have_db_column(:body).of_type(:text) }
  it { is_expected.to have_db_column(:user_id).of_type(:integer) }
  it { is_expected.to have_db_column(:task_id).of_type(:integer) }

  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :task }

  it { is_expected.to validate_presence_of :body }
end
