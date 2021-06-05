class Question < ApplicationRecord

  belongs_to :test
  has_many :answers

  validates :body, presence: true

  validate :validate_answer_count


  private

  def validate_answer_count
    errors.add(:answers) if answers.count > 4 || answers.count < 1
  end

end
