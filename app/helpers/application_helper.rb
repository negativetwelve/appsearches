module ApplicationHelper

  def full_title(page_title)
    base_title = "App Search"
    if page_title.empty?
      base_title
    else
      page_title
    end
  end

  def humanize_index(index, page, per_page)
    if page == 0
      return index + 1
    else
      return index + 1 + per_page * (page-1)
    end
  end

end
