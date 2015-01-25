class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable

  has_many :tasks
  has_many :task_owners, class_name: 'Task', foreign_key: 'owner_id'
  has_many :comments
end
