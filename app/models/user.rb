class User < ApplicationRecord

  serialize :tests, Array

  def user_tests_for_level(level)
    Test.where(id: tests, level: level)
  end
end
