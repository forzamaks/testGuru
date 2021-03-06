class Test < ApplicationRecord

  belongs_to :category
  has_many :questions, dependent: :restrict_with_error
  belongs_to :author, class_name: 'User', foreign_key: :user_id, optional: true
  has_many :test_passages, dependent: :restrict_with_error
  has_many :users, through: :test_passages
  has_many :user_badges
  has_many :badge, through: :user_badges

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :category_tests, -> { joins(:category) }

  validates :title, presence: true,
                    uniqueness: { scope: :level }

  validates :level, numericality: { greater_than_or_equal_to: 0 }


  def self.all_test_of_category(category_title)
    Test.joins(:category).where(categories: {title: category_title} ).order(id: :asc)
  end

end
