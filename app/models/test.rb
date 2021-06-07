class Test < ApplicationRecord

  belongs_to :category
  has_many :questions
  belongs_to :author, class_name: 'User', :foreign_key => 'user_id'
  has_and_belongs_to_many :users

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :category_tests, -> { joins(:category) }

  validates :title, presence: true,
                    uniqueness: true, if :title_level_unique?

  validates :level, numericality: { greater_than_or_equal_to: 0 },
                    uniqueness: true, if :title_level_unique?

  validate :title_level_unique

  def self.all_test_of_category(category)
    Test.joins(:category).where(title: category).order(id: :desc)
  end

  def title_level_unique?
    found_title = Test.find_by(title: title)
    found_level = Test.find_by(level: level)
    false if found_title.present? && fount_level.present?
    
    true
  end

end
