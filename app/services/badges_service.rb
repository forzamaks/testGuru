class BadgesService

  BADGE_TYPES = Badge.types

  def initialize(test_passage, current_user)
    @test_passage = test_passage
    @current_user = current_user
  end

  def create_bage(type)
    @badge = Badge.where(badge_type: type)
    @user_badge = UserBadge.new(test_id: @test_passage.test.id, user_id: @current_user.id, badge_id: @badge.first.id)

    errors.add(:badges, :invalid) unless @user_badge.save 

  end

  def reward_badge
    BADGE_TYPES.each {|badge_type| self.create_bage(badge_type) if validator(badge_type)}
  end
  
  
  private

  def validator(badge_type)
    self.send(badge_type) if is_uniq_badge?(badge_type)
  end

  def first_success_test
    @current_user.tests.where(id: @test_passage.test.id).count == 1
  end

  def success_level_tests
    current_level = @test_passage.test.level
    test_ids = Test.where(level: current_level).ids
    compleated_ids = TestPassage.all.where(test_id: test_ids).pluck(:test_id).uniq
    test_ids == compleated_ids
    puts test_ids == compleated_ids
  end

  def success_category_test
    category_id = @test_passage.test.category.id
    current_category_tests_ids = @test_passage.test.category.tests.ids
    compleated_ids = TestPassage.all.where(test_id: category_id).pluck(:test_id).uniq
    current_category_tests_ids == compleated_ids
    puts "#{current_category_tests_ids == compleated_ids} ddd"
  end

  def is_uniq_badge?(type)
    @badge = Badge.where(badge_type: type)
    @test = @test_passage.test
    @user_badges = UserBadge.where(user_id: @current_user.id, badge_id: @badge.first.id, test_id: @test.id)
    @user_badges.blank?
  end

end