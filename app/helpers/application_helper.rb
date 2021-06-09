module ApplicationHelper

  def full_year
    Time.zone.now.year
  end

  def github_url(author, repo)
    link_to 'Test Guru', "https://github.com/#{author}/#{repo}"
  end
end
