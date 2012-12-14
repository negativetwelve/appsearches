module ApplicationHelper

  def add_linkshare(url)
    return url + "&partnerId=30&siteID=2976862"
  end

  def full_title(page_title)
    base_title = "App Searches - find the best iPhone and iPad apps"
    if page_title.empty?
      base_title
    else
      page_title
    end
  end
  
  def image_url(source)
    "#{root_url[0...-1]}#{image_path(source)}"
  end

  def humanize_index(index, page, per_page)
    if page == 0
      return index + 1
    else
      return index + 1 + per_page * (page-1)
    end
  end

end
