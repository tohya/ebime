module ApplicationHelper

  # ページごとの完全なタイトルを返します。
  def full_title(page_title)
    base_title = "Ebime"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def position(user)
    case user.role
      when "3"
        "部長"
      when "2"
        "室長"
      when "1"
        "なし"
    end
  end

  def alert(user)

    kintais = Kintai.where("user_id = ?", user.id)
    user_projects = UserProject.where("user_id = ?", user.id)
    jissekis = Jisseki.where("user_project_id IN (?)", user_projects.ids)
    alert = []
    kintais.each do |k|
      jiss = jissekis.where("date = ?", k.date)
      j_time = 0;
      jiss.each do |j|
        j_time += j.time if j.time
      end
      k_time = work_time(k.start, k.end)
      if k_time != j_time
        alert << "#{k.date.month}/#{k.date.day}"
      end
    end
    alert    
  end

  def work_time(start_time, end_time)
    if start_time && end_time
      s = start_time.hour + start_time.min/60.0
      e = end_time.hour + end_time.min/60.0
      time = e - s
      time -= 1 if (s<=12) && (e>=13)
      time -= 0.5 if (s<=18) && (e>=18.5)
      time
    else
      0
    end
  end

end
