class Question < ApplicationRecord

  belongs_to :test
  has_many :answers, dependent: :restrict_with_error
  has_many :gists

  validates :body, presence: true
end
