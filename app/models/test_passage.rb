class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :question

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_next_question, on: :update

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def completed?
    question.nil?
  end

  def current_question
    test.questions.find_index(self.question) + 1
  end

  def test_result
    (self.correct_questions.to_f / test.questions.count.to_f * 100.0).to_i
    # self.correct_questions
  end

  private

  def before_validation_set_first_question
    self.question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    question.answers.correct
  end

  def before_update_next_question
    self.question = test.questions.order(:id).where('id > ?', question.id).first
  end
end
