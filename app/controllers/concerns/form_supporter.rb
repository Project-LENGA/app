module FormSupporter
  extend ActiveSupport::Concern

  def get_time_from_time_select_tag(obj, time_name)
    Time.local(
      obj["#{time_name}(1i)"],
      obj["#{time_name}(2i)"],
      obj["#{time_name}(3i)"],
      obj["#{time_name}(4i)"],
      obj["#{time_name}(5i)"]
    )
  end
end
