class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  default_value_for :language, 0
  default_value_for :category, 0
end
