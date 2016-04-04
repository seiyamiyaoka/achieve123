class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :charge, class_name: 'User', foreign_key: 'charge_id'
  validates :content, :title, presence: true
end
