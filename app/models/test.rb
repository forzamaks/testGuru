class Test < ApplicationRecord

  belongs_to :category
  has_many :questions
  belongs_to :user
  has_and_belongs_to_many :users

  def self.all_test_of_category(category)
    Test.joins('JOIN categories ON test.category_id = categories.id').where('categories.title = :title', title: category).order(id: desc)
  end

end
