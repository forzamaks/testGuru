class GistQuestionService

  CREATE_STATUS_REQUEST = 201.freeze
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status == CREATE_STATUS_REQUEST
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.title', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }

  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:title)
    content.join("\n")
  end
end