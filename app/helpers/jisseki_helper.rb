module JissekiHelper

  def sum_as_day(sum_by_day,d)
    sum = 0;
    sum_by_day.each do |x|
      sum += x[d]
    end
    sum
  end

  def find_kintai(user_id, month, day)
    date = Time.parse("#{month}/#{day}")
    Kintai.where("user_id = ? AND date = ?", user_id, date).first
  end

  def find_kintai_time(user_id, month, day)
    kintai = find_kintai(user_id, month, day)
    if kintai && kintai.start && kintai.end
      work_time(kintai.start,kintai.end)
    else
      0
    end
  end

end
