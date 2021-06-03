class User < ApplicationRecord

  has_many :tests, class_name: 'Test'
  has_and_belongs_to_many :tests

  def user_tests_for_level(level)
    tests.where(level: level)
  end
end
