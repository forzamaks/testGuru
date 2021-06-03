class Test < ApplicationRecord

  belongs_to :category
  has_many :questions
  belongs_to :user, class_name: 'User'
  has_and_belongs_to_many :users

  def self.all_test_of_category(category)
    category.where('category.title = :title', title: category).order(id: desc)
  end

end
