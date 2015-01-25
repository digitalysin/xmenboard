require 'rails_helper'

describe User do
  it { is_expected.to have_db_column :first_name }
  it { is_expected.to have_db_column :last_name }
  it { is_expected.to have_db_column :avatar }
  it { is_expected.to have_db_column(:active).of_type(:boolean) }
  it { is_expected.to have_db_column(:owner).of_type(:boolean) }
  it { is_expected.to have_db_column :email }
  it { is_expected.to have_db_column :encrypted_password }
  it { is_expected.to have_db_column :reset_password_token }
  it { is_expected.to have_db_column(:reset_password_sent_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:remember_created_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:sign_in_count).of_type(:integer) }
  it { is_expected.to have_db_column(:current_sign_in_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:last_sign_in_at).of_type(:datetime) }
  it { is_expected.to have_db_column :current_sign_in_ip }
  it { is_expected.to have_db_column :last_sign_in_ip }
  it { is_expected.to have_db_column :confirmation_token }
  it { is_expected.to have_db_column(:confirmed_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:confirmation_sent_at).of_type(:datetime) }
  it { is_expected.to have_db_column :unconfirmed_email }
end
