module SearchHelper

  def format_time(timestamp)
    Time.at(timestamp.to_i).strftime '%Y-%B-%d %H:%M:%S'
  end

end
