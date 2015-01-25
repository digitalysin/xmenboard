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

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :description }

  context 'before_save' do
    let(:task) { create :task, finished: false, finished_at: 1.day.ago }
    subject { task }

    context 'when finished attributes is set to false' do
      its(:finished_at) { is_expected.to be_blank }
    end

    context 'when finished is set to true' do
      before { task.update_attributes(finished: true) }
      its(:finished) { is_expected.to be_present }
    end
  end
end
