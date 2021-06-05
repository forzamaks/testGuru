class Category < ApplicationRecord
  has_many :tests

  default_scope { order(title: :asc) }
  scope :category_tests, -> (category_name) { joins(:tests).where(title: category_name).order(id: :desc) }

  validates :title, presence: true

end
