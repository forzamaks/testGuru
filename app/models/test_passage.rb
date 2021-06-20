class TestPassage < ApplicationRecord

  SUCCESS_RESLUT_TEST_IN_PERCENT = 85.freeze

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :next_question, on: :create
  before_update :next_question, on: :update

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def completed?
    current_question.nil?
  end

  def current_question_in_test
    test.questions.find_index(self.current_question) + 1
  end

  def test_result
    (self.correct_questions.to_f / test.questions.count.to_f * 100.0).to_i
  end

  def completed_percent
    (self.current_question_in_test.to_f / test.questions.count.to_f * 100.0).to_i
  end

  def success?
    self.test_result >= SUCCESS_RESLUT_TEST_IN_PERCENT
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort if answer_ids.present?
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if self.current_question.present?
      self.current_question = test.questions.order(:id).where('id > ?', self.current_question.id).first
    else
      self.current_question = test.questions.first
    end
  end
end
