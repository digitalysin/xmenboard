require 'rails_helper'

describe Task do
  it { is_expected.to have_db_column :name }
  it { is_expected.to have_db_column :description }
  it { is_expected.to have_db_column(:finished).of_type(:boolean) }
  it { is_expected.to have_db_column(:finished_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:owner_id).of_type(:integer) }
  it { is_expected.to have_db_column(:user_id).of_type(:integer) }

  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :owner }
  it { is_expected.to have_many :comments }
end
