class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, presence: true
  default_scope { order(created_at: :desc) }
end
