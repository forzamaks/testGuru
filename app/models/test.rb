class Test < ApplicationRecord

  def self.all_test_of_category(category)
    category_id = Category.select(:id).where(title: category)
    Test.where(category_id: category_id.first.id).order(id: :desk)
  end

end
