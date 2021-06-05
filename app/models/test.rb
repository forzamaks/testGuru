class Test < ApplicationRecord

  belongs_to :category
  has_many :questions
  belongs_to :author, class_name: 'User', :foreign_key => 'user_id'
  has_and_belongs_to_many :users

  def self.all_test_of_category(category)
    Category.joins(:tests).where(title: category).order(id: :desc)
  end

end
