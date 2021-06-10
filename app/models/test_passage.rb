class TestPassage < ApplicationRecord

  SUCCESS_RESLUT_TEST_IN_PERCENT = 85.freeze

  belongs_to :user
  belongs_to :test
  belongs_to :question, class_name: 'Question',  optional: true

  before_validation :next_question, on: :create
  before_update :next_question, on: :update

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def completed?
    question.nil?
  end

  def current_question_in_test
    test.questions.find_index(self.question) + 1
  end

  def test_result
    (self.correct_questions.to_f / test.questions.count.to_f * 100.0).to_i
  end

  def success?
    if self.test_result >= SUCCESS_RESLUT_TEST_IN_PERCENT
      true
    else
      false
    end
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort if answer_ids.present?
  end

  def correct_answers
    question.answers.correct
  end

  def next_question
    self.question = self.question.present? ? 
                      test.questions.order(:id).where('id > ?', self.question.id).first :
                      test.questions.first
  end
end
