module ApplicationHelper
<<<<<<< HEAD
  def get_index_page page = :page, key
=======
  def get_index_page page = "page", key
>>>>>>> Manage User
    params[page].to_i * Settings.end_stt + key + Settings.start_stt
  end

  def get_index key
    key + Settings.start_stt
  end
end
