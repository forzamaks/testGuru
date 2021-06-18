class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable

  has_many :created_tests, class_name: 'Test', foreign_key: :user_id
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :gists

  scope :level_tests, -> (level) { where(level: level) }

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP,
  message: 'Invalid e-mail format' }

  def user_tests_for_level(level)
    tests.level_tests(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.type.to_sym == :Admin
  end

end
