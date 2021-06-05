class User < ApplicationRecord

  has_many :created_tests, class_name: 'Test'
  has_and_belongs_to_many :tests

  scope :level_tests, -> (level) { where(level: level) }

  validates :email, presence: true

  def user_tests_for_level(level)
    tests.level_tests(level)
  end
end
