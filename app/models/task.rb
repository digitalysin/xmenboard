class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :owner, class_name: 'User'
  has_many :comments

  validates :name, :description, presence: true

  before_save :before_save_callback

  private
  def before_save_callback
    if finished?
      self.finished_at = DateTime.now
    else
      self.finished_at = nil
    end
  end
end
