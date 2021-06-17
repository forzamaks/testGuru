module ApplicationHelper

  TYPES_FLASH = {notice: :success, alert: :danger}.freeze

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
  def flash_class_name(name)
    TYPES_FLASH[name.to_sym] || name
  end
end
