class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :owner, class_name: 'User'
  has_many :comments
end
