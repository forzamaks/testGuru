module ApplicationHelper

  def full_year
    Time.zone.now.year
  end

  def github_url(author, repo)
    @url = "https://github.com/#{author}/#{repo}"
  end
end
