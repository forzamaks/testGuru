class User < ApplicationRecord

  def user_tests_for_level(level)
    Test.where(level: level).joins('JOIN tests_users ON tests_users.test_id = tests.id').where(tests_users: {user_id: id})
  end
end
