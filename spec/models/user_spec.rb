require 'rails_helper'

describe User do
  it { is_expected.to have_db_column :first_name }
  it { is_expected.to have_db_column :last_name }
  it { is_expected.to have_db_column :email }
  it { is_expected.to have_db_column :encrypted_password }

  it { is_expected.to have_many :tasks }
  it { is_expected.to have_many(:task_owners).class_name('Task').with_foreign_key(:owner_id) }
  it { is_expected.to have_many :comments }
end
