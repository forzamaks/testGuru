module ApplicationHelper

  def full_year
    Time.zone.now.year
  end

  def github_url(author, repo)
    link_to 'Test Guru', "https://github.com/#{author}/#{repo}"
  end

  def flash_message(type)
    if flash[type]
      content_tag :p, flash[type], class:'flash alert'
    end
  end
end
