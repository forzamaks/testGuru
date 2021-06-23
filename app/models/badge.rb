class Badge < ApplicationRecord
  has_many :user_badges
  has_many :user, through: :user_badges
  has_many :user_badges
  has_many :test, through: :user_badges

  validates :title, presence: true
  validates :image_url, presence: true

  attr_accessor :types

  def types
    @types = %i[first_success_test success_level_tests sucess_category_test ]
  end

end