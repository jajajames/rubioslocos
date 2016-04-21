module ApplicationHelper

  def human_time(time)
    time.to_date.to_s.humanize.slice(2,9)
  end

  def one_word(str)
    str.split(' ').first.gsub(/,/, '')
  end
end
