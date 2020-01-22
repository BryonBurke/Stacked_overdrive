class Question < ApplicationRecord
  scope :today, -> { where("created_at >=?", Time.now.beginning_of_day)}
  has_many :answers, dependent: :destroy
  belongs_to :user
end
