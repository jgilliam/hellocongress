# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def time_ago(time, options = {})
    if request.xhr?
      distance_of_time_in_words_to_now(time) + ' ago'
    else
      options[:class] ||= "timeago"
      content_tag(:abbr, time.to_s, options.merge(:title => time.getutc.iso8601)) if time
    end
  end  
  
  def flash_div *keys
    keys.collect { |key| content_tag(:div, flash[key], :class => "flash_#{key}") if flash[key] }.join
  end

end
