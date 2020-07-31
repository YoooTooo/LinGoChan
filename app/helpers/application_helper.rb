module ApplicationHelper

#タイトルを渡すためのヘルパー
  def full_title(page_title = '')
      base_title = "LingGoChan"
      if page_title.empty?
        base_title
      else
         base_title + " / " + page_title
      end
  end

end
