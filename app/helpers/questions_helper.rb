module QuestionsHelper
  
  def question_header
    @type = params[:id].present? ? 'Edit' : 'Create new'
    @test_title = @test.present? ? @test.title : @test_from_question.title
    @title = "#{@type} #{@test_title} question"
  end

end
