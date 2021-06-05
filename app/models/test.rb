class Test < ApplicationRecord

  belongs_to :category
  has_many :questions
  belongs_to :author, class_name: 'User', :foreign_key => 'user_id'
  has_and_belongs_to_many :users

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }


  validates :title, presence: true,
                    uniqueness: true

  validates :level, numericality: { greater_than_or_equal_to: 0 },
                    uniqueness: true



  def self.all_test_of_category(category)
    Category.category_tests(category)
  end


end
