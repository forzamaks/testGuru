class Answer < ApplicationRecord

  belongs_to :question

  scope :correct, -> { where(correct: true) }
  scope :join_question, -> { joins(:question) }

  validates :title, presence: true


  validate :validate_answer_count, on: :create


  private

  def validate_answer_count

    answers = Answer.join_question.where(question_id: id)
    errors.add(:question) if answers.count > 4
  end

end
