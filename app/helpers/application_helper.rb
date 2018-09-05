module ApplicationHelper
  def format_error_messages(type, message)
    if message.is_a?(Array)
      message.map { |msg| content_tag(:li, msg) }.join
    else
      content_tag :div, message, class: type
    end
  end
end
