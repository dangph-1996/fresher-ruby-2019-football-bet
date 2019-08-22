module ApplicationHelper
  def get_index_page page = :page, key
    params[page].to_i * Settings.end_stt + key + Settings.start_stt
  end

  def get_index key
    key + Settings.start_stt
  end
end
