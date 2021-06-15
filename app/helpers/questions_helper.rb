module QuestionsHelper
  
  def question_header(question)
    "#{question.persisted? ? t('.edit') : t('.new')} #{question.test.title} #{t('.question')}"
  end

end
