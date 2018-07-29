module ApplicationHelper
  # def randomized_background_image
  #   images = ["volunteer.jpeg", "volunteer_2.jpeg", "volunteer_3.jpeg"]
  #   images.sample
  # end

  def format_error_messages(type, message)
    if message.is_a?(Array)
      message.map { |msg| content_tag(:li, msg) }.join
    else
      content_tag :div, message, class: type
    end
  end
end
