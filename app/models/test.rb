class Test < ApplicationRecord

  belongs_to :category
  has_many :questions
  belongs_to :author, class_name: 'User', foreign_key: :user_id, optional: true
  has_many :test_passages
  has_many :users, through: :test_passages

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :category_tests, -> { joins(:category) }

  validates :title, presence: true,
                    uniqueness: { scope: :level }

  validates :level, numericality: { greater_than_or_equal_to: 0 }


  def self.all_test_of_category(category)
    Test.joins(:category).where(title: category).order(id: :desc)
  end

end
