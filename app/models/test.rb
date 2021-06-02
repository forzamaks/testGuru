class Test < ApplicationRecord
  
  def self.all_test_of_category(category)
    Test.joins('JOIN categories ON test.category_id = categories.id').where('categories.title = :title', title: category).order(id: desc)
  end

end
