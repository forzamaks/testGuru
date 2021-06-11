require 'digest/sha1'

class User < ApplicationRecord

  has_many :created_tests, class_name: 'Test', foreign_key: :user_id
  has_many :test_passages
  has_many :tests, through: :test_passages

  scope :level_tests, -> (level) { where(level: level) }

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP,
  message: 'Invalid e-mail format' }
  has_secure_password

  def user_tests_for_level(level)
    tests.level_tests(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
